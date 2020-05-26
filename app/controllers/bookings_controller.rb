class BookingsController < ApplicationController

  def index
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @inflatable = Inflatable.find(params[:inflatable])
    @booking.inflatable = @inflatable
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

    redirect_to dashboard_path(@booking.user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to dashboard_path(@booking.user)
  end

  private

  def booking_params
    all_params = [:start_date, :end_date, :status, :user, :inflatable]
    params.require(:booking).permit(all_params)
  end

end
