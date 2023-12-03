class FormSerializer < Panko::Serializer
  attributes :id,
             :title,
             :description,
             :users,
             :assignments

  def users
    object.users
  end

  def assignments
    object.assignments
  end
end
