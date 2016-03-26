class BookingsController < ApplicationController
  def new
    if @flight = Flight.find_by(id: params[:flight_id])
      @booking = @flight.bookings.build
      params[:num_passengers].to_i.times do
        @booking.passengers.build
      end
    else
      redirect_to root_url
    end
  end

  def create
    @flight = Flight.find_by(id: params[:flight_id])
    @booking = @flight.bookings.build(booking_params)
    validities = @booking.passengers.map(&:valid?)
    if @booking.valid? && validities.all? { |v| v }
      @booking.save
      @booking.passengers.each { |passenger| passenger.save }
      flash[:success] = "Booking successful!"
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    @flight = @booking.flight
  end

private

  def booking_params
    params.require(:booking).permit(passengers_attributes: [:name, :email])
  end
end
