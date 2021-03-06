class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 3}

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by email: email.strip.downcase
    if @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
