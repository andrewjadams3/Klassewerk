class UploadController < ApplicationController
  S3_HEADER = "https://s3-us-west-2.amazonaws.com/classwork/"

  def index
    render :upload_form, layout: false
  end


  def upload
    if current_teacher
      file = params['file'].tempfile.path

      puts file.inspect
      filename = convert_to_png(file)
      upload_to_s3(filename)

      worksheet = current_teacher.worksheets.create(url: S3_HEADER + filename, name: "New Worksheet", input_fields: [])

      respond_to do |format|
        format.json {render :json => {id: worksheet.id}}
      end
    else
      respond_to do |format|
        format.json {render :json => {error: "must be logged in"}, status: 401}
      end
    end
    # respond_to do |format|
    #   format.json {render :json => {id: 20}}
    # end
  end



  def convert_to_png(file)
    image = MiniMagick::Image.open(file)

    image.resize('600x600^')

    image.colors('16')

    image.append
    image.alpha('remove')
    image.format('png')

    image.write(file)

    return file
  end

  def upload_to_s3(filename)
    s3 = AWS::S3.new(
      :access_key_id => ENV['AWS_KEY'],
      :secret_access_key => ENV['AWS_SECRET']
    )
    bucket = s3.buckets['classwork']

    bucket.objects[filename].write(:file => filename)
  end

  def random_filename
    random = ""
    loop do
      random = SecureRandom::hex(6)
      break unless Worksheet.find_by(url: random)
    end
    return random
  end

end
