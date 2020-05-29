class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @inflatables = Inflatable.all
  end

  def dashboard
    @user = current_user
  end


end
