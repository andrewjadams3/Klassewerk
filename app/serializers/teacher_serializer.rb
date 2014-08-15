class TeacherSerializer < ActiveModel::Serializer
  has_one :school
  attributes :id, :first_name, :last_name, :username, :email, :security_question, :school
end