class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments
  belongs_to :role

  before_create :generate_authentication_token

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break unless User.find_by(authentication_token: authentication_token)
     end
  end

  def admin?
    role.name == 'admin'
  end

  def receptionist?
    role.name == 'receptionist'
  end

  def nurse?
    role.name == 'nurse'
  end

  def doctor?
    role.name == 'doctor'
  end

  def patient?
    false
  end
end
