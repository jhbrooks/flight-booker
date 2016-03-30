class Booking < ActiveRecord::Base
  unless Rails.env.test?
    obfuscate_id
  end

  belongs_to :flight
  has_many :passengers, inverse_of: :booking

  accepts_nested_attributes_for :passengers

  validates :flight, presence: true
end
