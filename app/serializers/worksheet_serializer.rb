class WorksheetSerializer < ActiveModel::Serializer
  embed :ids
  
  attributes :id, :name, :url, :input_fields
end
