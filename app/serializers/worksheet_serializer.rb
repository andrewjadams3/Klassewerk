class WorksheetSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :input_fields
end
