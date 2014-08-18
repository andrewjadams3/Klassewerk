class StudentSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :first_name, :last_name, :username
  has_many :responses
  has_one :teacher
end