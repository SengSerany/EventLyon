class Attendance < ApplicationRecord
	after_create :someone_attend_to_your_event

	def someone_attend_to_your_event
    	UserMailer.attendance_email(self.event, self.attendant).deliver_now
  	end

	belongs_to :attendant, class_name: "User"
	belongs_to :event
end
