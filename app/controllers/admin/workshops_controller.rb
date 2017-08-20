module Admin
  class WorkshopsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin_user!

    def index
      @workshops = Workshop.all
    end

    def show
      @workshop = Workshop.find(params[:id])
    end

    def new
      @workshop = Workshop.new
    end

    def create
      workshop = Workshop.new(permitted_params)
      if workshop.valid?
        workshop.save
        flash[:notice] = 'Workshop created'
        redirect_to admin_workshop_path(workshop)
      else
        flash[:error] = "Create unsuccessful: #{workshop.errors.full_messages}"
        redirect_to new_admin_workshop_path(workshop)
      end
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
        redirect_to admin_workshop_path(workshop)
      else
        flash[:error] = "Update unsuccessful: #{workshop.errors.full_messages}"
        redirect_to edit_admin_workshop_path(workshop)
      end
    end

    def destroy
      workshop = Workshop.find(params[:id])
      workshop.destroy
      if workshop.persisted?
        flash[:error] = "Delete unsuccessful: #{workshop.errors.full_messages}"
        redirect_to admin_workshop_path(workshop)
      else
        flash[:notice] = 'Workshop deleted'
        redirect_to admin_workshops_path
      end
    end

    private

    def permitted_params
      params.require(:workshop).permit(:name, :url, :description, :image_url)
    end
  end
end
