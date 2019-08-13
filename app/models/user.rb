class User < ApplicationRecord
	  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :attendances, foreign_key: 'attendant_id', class_name: "Attendance"
	has_many :events, foreign_key: 'admin_id', class_name: "Event"

	validates :email, uniqueness: true,  presence: true,  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Votre adress email n'est pas valide." }
end

