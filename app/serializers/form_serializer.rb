class FormSerializer < Panko::Serializer
  attributes :id,
             :title,
             :description,
             :objective,
             :users,
             :assignments

  def users
    object.users
  end

  def assignments
    object.assignments
  end
end
