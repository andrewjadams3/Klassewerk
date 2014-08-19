class UploadController < ApplicationController
  S3_HEADER = "https://s3-us-west-2.amazonaws.com/classwork/"

  def index
    render :upload_form, layout: false
  end


  def upload
    if current_teacher
      filename = random_filename + ".gif"
      file = params['file'].tempfile.path

      convert_to_png(file, filename)

      respond_to do |format|
        format.json {render :json => {filename: filename}}
      end
    else
      respond_to do |format|
        format.json {render :json => {error: "must be logged in"}, status: 401}
      end
    end
  end

  def convert_to_png(file, filename)
    size = File.size(file)

    image = MiniMagick::Image.open(file)

    image.resize('600x600^')
    image.append
    image.alpha('remove')
    image.format('gif')

    image.write("public/" + filename)
    return file
  end

  def random_filename
    random = ""
    loop do
      random = SecureRandom::hex(6)
      break unless Worksheet.find_by(url: random)
    end
    return random
  end



  def process_image
    if current_teacher
      filename = 'public/' + params['filename']

      if params['rotation'] != '0'
        image = MiniMagick::Image.open(filename)
        image.rotate(params['rotation'])
        image.write(filename)
      end

      upload_to_s3(filename)

      params['name'] = "New Worksheet" if params['name'].strip == ""

      worksheet = Worksheet.create(
        url: S3_HEADER + filename, 
        name: params['name'].strip||"New Worksheet", 
        input_fields: [],
        teacher_id: current_teacher.id
      )

      respond_to do |format|
        format.json {render :json => {id: worksheet.id}}
      end
    else
      respond_to do |format|
        format.json {render :json => {error: "must be logged in"}, status: 401}
      end
    end
  end

  def upload_to_s3(filename)
    s3 = AWS::S3.new(
      :access_key_id => ENV['AWS_KEY'],
      :secret_access_key => ENV['AWS_SECRET']
    )
    bucket = s3.buckets['classwork']

    bucket.objects[filename].write(:file => filename)
  end

end
