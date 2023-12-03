class AssignmentSerializer < Panko::Serializer
  attributes :id,
             :description,
             :user_assignment,
             :form

  def user_assignment
    object.user.username
  end

  def form
    object.form.title
  end
end
