class UploadController < ApplicationController

  def index
    render :upload_form, layout: false
  end


  def upload
    image = convert_pdf(params['file'].tempfile.path)
    upload_to_s3(image)
    redirect_to '/temp/upload'
  end

  def convert_pdf(file)
    image = MiniMagick::Image.open(file)

    image.combine_options do |mogrify|
      mogrify.alpha 'remove'
      mogrify.append
    end

    image.format('png')
    image.write('output.png')
    return 'output.png'
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
    loop do
      random = SecureRandom::hex(6)
      break
    end
    return random
  end

end