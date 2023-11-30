class CompanySerializer < Panko::Serializer
  attributes :id,
             :name,
             :address,
             :description,
             :users

  def users
    object.users
  end
end
