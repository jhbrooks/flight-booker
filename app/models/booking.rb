class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :passengers, inverse_of: :booking

  accepts_nested_attributes_for :passengers

  validates :flight, presence: true
end
