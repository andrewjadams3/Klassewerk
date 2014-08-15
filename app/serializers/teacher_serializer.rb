class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :security_question
end