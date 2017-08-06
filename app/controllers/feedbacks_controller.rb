class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @workshop = workshop
    @feedback = Feedback.new
  end

  def create
    feedback = Feedback.new(permitted_params.merge(workshop: workshop, user: current_user))
    if feedback.valid?
      feedback.save
      flash[:notice] = 'Feedback added'
      redirect_to workshop_path(workshop)
    else
      flash[:error] = "Feedback was not added: #{feedback.errors.full_messages}"
      redirect_to new_workshop_feedback_path(workshop)
    end
  end

  private

  def workshop
    Workshop.find(params[:workshop_id])
  end

  def permitted_params
    params.require(:feedback).permit(:body)
  end
end
