class Form < ApplicationRecord
  has_many    :assignments
  has_many    :users, through: :assignments

  enum status: {
    created: 0,
    assigned: 1,
    approved: 2
  }

  enum priority_level: {
    low: 0,
    medium: 1,
    high: 2,
    critical: 3
  }
end
