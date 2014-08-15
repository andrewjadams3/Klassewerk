class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :code, :location, :name, :mascot
end