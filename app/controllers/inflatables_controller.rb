class InflatablesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    # eighter with active record search #
    #------------------------------------#

    # if params[:query].present?
    #   sql_query = "inflatables.category @@ :query OR inflatables.name @@ :query OR inflatables.description @@ :query OR users.first_name @@ :query OR users.last_name @@ :query OR users.username @@ :query"
    #   @inflatables = Inflatable.geocoded.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @inflatables = Inflatable.geocoded
    # end


    # or with PgSearch gem
    #------------------------------------#


    if params[:query].present?
      @inflatables = Inflatable.geocoded.global_search(params[:query])
    else
      @inflatables = Inflatable.geocoded
    end


    # or with out search #
    #------------------------------------#

    # @inflatables = Inflatable.all
    # @inflatables = Inflatable.geocoded
    # returns inflatables with coordinates

    #------------------------------------#

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
