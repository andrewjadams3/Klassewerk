class ResponseSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :answers, :submitted, :notes
  has_one :worksheet, :student
end
