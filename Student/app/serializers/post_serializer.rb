require 'jsonapi-serializers'

class PostSerializer 
include JSONAPI::Serializer

def attributes  
  	data = super
  	data[:title] = object.title if object.title.present?
  	data[:content] = object.content if object.content.present?

  end

  
end



