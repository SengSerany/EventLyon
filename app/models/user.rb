class User < ApplicationRecord
	has_many :attendances, foreign_key: 'attendant_id', class_name: "Attendance"
	has_many :events, foreign_key: 'admin_id', class_name: "Event"

	validates :email, uniqueness: true,  presence: true,  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Votre adress email n'est pas valide." }
end

