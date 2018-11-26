class Admin < ApplicationRecord
  include AdminAuthentication

  # Validations
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, presence: true

  def name
    [first_name, last_name].join(' ')
  end

end
