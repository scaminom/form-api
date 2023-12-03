class FormSerializer < Panko::Serializer
  attributes :id,
             :title,
             :description,
             :application_number,
             :date,
             :address,
             :justification,
             :status,
             :priority_level,
             :deadline,
             :requesting,
             :assigned_users

  # def users
  #   object.users
  # end

  # def assignments
  #   object.assignments
  # end

  def requesting
    object.creator.username
  end

  def assigned_users
    users = object.assigned_users
    users.map(&:username)
  end
end
