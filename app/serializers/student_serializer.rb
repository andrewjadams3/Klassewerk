class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :security_question
end