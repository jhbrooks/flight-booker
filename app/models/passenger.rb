class Passenger < ActiveRecord::Base
  belongs_to :booking, inverse_of: :passengers
  has_one :flight, through: :booking

  validates :booking, presence: true
  validates :name, presence: true
  validates :email, presence: true
end
