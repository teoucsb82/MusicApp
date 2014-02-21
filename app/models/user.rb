class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	attr_reader	:password

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validates :password, :length => { :minimum => 3, :allow_nil => true }
  validates :password_digest, :presence => true
  validates :session_token, :presence => true, :uniqueness => true

  before_validation :ensure_session_token

	def self.find_by_credentials(params)
		user = User.find_by_email(params[:email])
		return user if user && user.is_password?(params[:password])
		nil
	end

	def self.generate_session_token
		SecureRandom::urlsafe_base64(16)
	end

	def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
	end

	def password=(unencrypted_password)
		@password = unencrypted_password
		self.password_digest = BCrypt::Password.create(unencrypted_password)
	end

	def is_password?(unencrypted_password)
		BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
	end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
