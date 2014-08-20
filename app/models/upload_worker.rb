class UploadWorker
  include Sidekiq::Worker

  def perform(filepath)
    puts filepath
  end
end