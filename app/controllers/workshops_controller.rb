class WorkshopsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @workshops = Workshop.all
  end

  def new
    @workshop = Workshop.new
  end

  def create
    workshop = Workshop.new(permitted_params)
    if workshop.valid?
      workshop.save
      flash[:notice] = 'Workshop created'
      redirect_to workshop_path(workshop)
    else
      flash[:error] = "Create unsuccessful: #{workshop.errors}"
      redirect_to new_workshop_path(workshop)
    end
  end

  def show
    @workshop = Workshop.find(params[:id])
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def update
    workshop = Workshop.find(params[:id])
    workshop.update(permitted_params)
    if workshop.valid?
      workshop.save
      flash[:notice] = 'Workshop updated'
      redirect_to workshop_path(workshop)
    else
      flash[:error] = "Update unsuccessful: #{workshop.errors}"
      redirect_to edit_workshop_path(workshop)
    end
  end

  def destroy
    workshop = Workshop.find(params[:id])
    workshop.destroy
    if workshop.persisted?
      flash[:error] = "Delete unsuccessful: #{workshop.errors}"
      redirect_to workshop_path(workshop)
    else
      flash[:notice] = 'Workshop deleted'
      redirect_to workshops_path
    end
  end

  private

  def permitted_params
    params.require(:workshop).permit(:name, :url)
  end
end
