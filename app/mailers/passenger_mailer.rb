class PassengerMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  default from: "Flight Booker <flight-notifications@heroku.com>"

  def confirmation_email(passenger, flight)
    @passenger = passenger
    @flight = flight
    mail(to: @passenger.email, subject: "Flight booked (but not really)")
  end
end
