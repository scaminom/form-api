class Role < ApplicationRecord
  enum name: { user: 0, admin: 1, guess: 2, developer: 3, employee: 4 }
end
