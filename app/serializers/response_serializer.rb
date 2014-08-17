class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :answers, :submitted
end
