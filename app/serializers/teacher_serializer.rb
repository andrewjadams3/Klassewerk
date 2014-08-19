class TeacherSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :first_name, :last_name, :email, :class_code
  has_many :worksheets
  has_many :students
end
