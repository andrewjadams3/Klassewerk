class UploadController < ApplicationController

  def index
    render :upload_form, layout: false
  end


  def upload
    temp = params['file'].tempfile
    file = File.join("public", params['file'].original_filename)
    FileUtils.cp temp.path, file

    puts file.inspect
    convert_pdf(file)
    upload_to_s3(params['file'])
    redirect_to '/temp/upload'
  end

  def convert_pdf(file)
    image = MiniMagick::Image.open(file)

    image.append

    image.format('png')

    filename = 'public/' + random_filename + '.png'
    image.write(filename)

    return filename
  end

  def upload_to_s3(filename)
    s3 = AWS::S3.new(
      :access_key_id => ENV['AWS_KEY'],
      :secret_access_key => ENV['AWS_SECRET']
    )
    bucket = s3.buckets['classwork']

    Worksheet.create(url: filename)
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