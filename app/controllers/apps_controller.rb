class AppsController < ApplicationController
  resource_description do
    formats [:json]
    short "API for managing jobs"
  end

  api :GET, '/jobs', "Returns all jobs"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def index
    included = params[:include].try(:split, ",")
    render json: App.all, include: included
  end

  api :GET, '/jobs/:id', "Returns the job with the given id"
  desc "Returns the job with the given id"
  param :id, :number, "Id of the App"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def show
    included = params[:include].try(:split, ",")
    id = params[:id]
    render json: App.find(id), include: included
  end

end
