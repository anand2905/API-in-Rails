require 'jsonapi-serializers'

class UserSerializer 
include JSONAPI::Serializer

  def attributes  
  	data = super
  	data[:name] = object.name if object.name.present?
  	data[:email] = object.email if object.email.present?
    data
  end
end
