class UserSerializer < Panko::Serializer
  attributes :id, 
             :username,
             :assignments,
             :role

  def assignments
    object.assignments
  end
end
