class Event < ApplicationRecord
attr_accessor :start_date, :duration, :title, :description, :price, :location

	belongs_to :admin, class_name: "User"

 	validates :start_date, presence: true, numericality: {greater_than_or_equal_to: Time.now.to_i}
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  def duration_multiple_of_5?
    duration % 5 == 0
    errors.add(:duration, "Les minutes doit être un multiple de 5")
  end
end

