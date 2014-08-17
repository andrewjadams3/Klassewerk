class ResponseSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :answers, :submitted
  has_one :worksheet, :student
end
