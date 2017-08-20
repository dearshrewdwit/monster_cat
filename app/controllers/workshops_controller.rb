class WorkshopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workshops = Workshop.all
  end

  def show
    @workshop = Workshop.find(params[:id])
  end
end
