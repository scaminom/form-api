class AssignmentSerializer < Panko::Serializer
  attributes :id,
             :description,
             :user,
             :form,
             :created_at,
             :updated_at

  def user
    object.user
  end

  def form
    object.form
  end
end
