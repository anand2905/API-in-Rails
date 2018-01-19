class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
end