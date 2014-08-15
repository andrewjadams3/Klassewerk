class StudentSerializer < ActiveModel::Serializer
  has_one :school
  attributes :id, :first_name, :last_name, :username, :security_question, :school
end