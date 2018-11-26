require 'jwt_auth_token'

module AdminAuthentication
  extend ActiveSupport::Concern


  included do

    # For authentication with password
    has_secure_password

  end

  module ClassMethods

    # Login admin using email and password
    def login email, password
      admin = Admin.find_by("email = ?", email)
      admin && admin.authenticate(password) ? admin : false
    end

  end



  def auth_token
    payload = { admin_id: id }
    JwtAuthToken.generate_token(payload)
  end



  # Generate random token for any column passed as an argument
  def generate_token column
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Admin.exists?(column => self[column])
  end

end
