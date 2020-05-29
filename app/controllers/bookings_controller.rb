class BookingsController < ApplicationController

  def index
  end

  def create
    @inflatable = Inflatable.find(params[:inflatable_id])
    @booking = Booking.new(booking_params)
    @booking.inflatable = @inflatable
    @booking.user = current_user
    @booking.save

    redirect_to dashboard_path
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

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted!
    redirect_to dashboard_path(@booking.user)
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.rejected!
    redirect_to dashboard_path(@booking.user)
  end

  private

  def booking_params
    all_params = [:start_date, :end_date, :status, :user, :inflatable]
    params.require(:booking).permit(all_params)
  end


end
