class Attendance < ApplicationRecord
	has_many :attendants, class_name: "User"
	belongs_to :event
end
