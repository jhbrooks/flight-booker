class FlightsController < ApplicationController
  def index
    @from_options = Flight
      .joins("INNER JOIN airports ON airports.id = flights.from_id")
      .distinct.order("airports.code").pluck(:code, :from_id)

    @to_options = Flight
      .joins("INNER JOIN airports ON airports.id = flights.to_id")
      .distinct.order("airports.code").pluck(:code, :to_id)

    @start_date_options = Flight.select(:start).distinct.pluck(:start)
                                .map { |sd| [formatted_start_date(sd),
                                             parsable_start_date(sd)] }
                                .uniq.sort

    @passenger_options = [1, 2, 3, 4]

    @matching_flights = Flight.where("flights.from_id = :from_id AND "\
                                     "flights.to_id = :to_id AND "\
                                     "flights.start BETWEEN :s_day AND :e_day",
                                     from_id: params[:from_id],
                                     to_id: params[:to_id],
                                     s_day: start_day(timify(params[:start])),
                                     e_day: end_day(timify(params[:start])))
                              .includes(:from_airport, :to_airport)
  end

private

  def start_day(date)
    return Time.utc(1970) if date.nil?
    Time.utc(date.year, date.month, date.day)
  end

  def end_day(date)
    return Time.utc(2030) if date.nil?
    Time.utc(date.year, date.month, date.day + 1, 2, 59, 59)
  end

  def timify(date_str)
    return nil if date_str.nil?
    DateTime.strptime(date_str, "%m/%d/%Y")
  end
end
