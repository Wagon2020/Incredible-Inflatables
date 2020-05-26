class BookingsController < ApplicationController

  def index
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @inflatable = Inflatable.find(params[:inflatable])
    @booking.inflatable = @inflatable
  end

  private

  def booking_params
    all_params = [:start_date, :end_date, :status, :user, :inflatable]
    params.require(:booking).permit(all_params)
  end

end
