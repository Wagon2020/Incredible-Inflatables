class InflatablesController < ApplicationController

  def index
    @inflatables = Inflatable.all
  end

  def show
    @inflatable = Inflatable.find(params[:id])
  end

  def new
    @inflatable = Inflatable.new
  end

  def create
    @inflatable = Inflatable.new(inflatable_params)
    @inflatable.save

    if @inflatable.save
      redirect_to @inflatable, notice: 'Inflatable was successfully created.'
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

    redirect_to inflatable_path(@inflatable)
  end

  def destroy
    @inflatable = Inflatable.find(params[:id])
    @inflatable.destroy

    redirect_to inflatables_path
  end

  private

  def set_inflatable
    @inflatable = Inflatable.find(params[:id])
  end

  def inflatable_params
    params.require(:inflatable).permit([:name, :photo])
  end

end
