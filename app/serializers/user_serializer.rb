class UserSerializer < Panko::Serializer
  attributes :id, 
             :username,
             :role,
             :assignments

  def role
    object.role
  end

  def assignments
    object.assignments
  end
end
