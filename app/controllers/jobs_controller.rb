class JobsController < ApplicationController
  def index
    included = params[:include].try(:split, ",")
    render json: Job.all, include: included
  end

end
