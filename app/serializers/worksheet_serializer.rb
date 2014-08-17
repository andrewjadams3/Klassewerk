class WorksheetSerializer < ActiveModel::Serializer
  embed :ids
  
  attributes :id, :name, :url, :input_fields
  has_many :responses
end
