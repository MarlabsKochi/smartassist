class User < ActiveRecord::Base
#   require "point-in-polygon/Point"
# require "point-in-polygon/Polygon"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments
  belongs_to :role
  serialize :authentication_token

  #before_create :generate_authentication_token

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break unless User.find_by(authentication_token: authentication_token)
     end
  end

  def admin?
    role.try(:name) == 'admin'
  end

  def receptionist?
    role.try(:name) == 'receptionist'
  end

  def nurse?
    role.try(:name) == 'nurse'
  end

  def doctor?
    role.try(:name) == 'doctor'
  end

  def patient?
    false
  end
end
