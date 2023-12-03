class Assignment < ApplicationRecord
  before_save   :change_status_form
  belongs_to    :user
  belongs_to    :form

  def change_status_form
    self.form.status = :assigned
    self.form.save
  end
end
