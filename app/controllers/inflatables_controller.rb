class InflatablesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    # @inflatables = Inflatable.all
    @inflatables = Inflatable.geocoded # returns inflatables with coordinates

    @markers = @inflatables.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @inflatable = Inflatable.find(params[:id])
    @booking = Booking.new
  end

  def new
    @inflatable = Inflatable.new
  end

  def create
    @inflatable = Inflatable.new(inflatable_params)
    @inflatable.user = current_user
    @inflatable.save

    if @inflatable.save
      redirect_to dashboard_path, notice: 'Inflatable was successfully created.'
    else
      render :new
    end
  end

  def edit
    @inflatable = Inflatable.find(params[:id])
  end

  def update
    @inflatable = Inflatable.find(params[:id])
    @inflatable.update(inflatable_params)

    redirect_to dashboard_path
  end

  def destroy
    @inflatable = Inflatable.find(params[:id])
    @inflatable.destroy

    redirect_to dashboard_path
  end

  private

  def set_inflatable
    @inflatable = Inflatable.find(params[:id])
  end

  def inflatable_params
    all_params = [:name, :category, :location, :price, :condition, :description, :user, :photo]
    params.require(:inflatable).permit(all_params)
  end

end
