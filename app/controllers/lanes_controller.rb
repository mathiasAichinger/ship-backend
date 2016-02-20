class LanesController < ApplicationController
  resource_description do
    formats [:json]
    short "API for managing builds"
  end

  api :GET, '/lanes', "Returns all lanes"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def index
    included = params[:include].try(:split, ",")
    render json: Lane.all, include: ["actions"]
  end

  api :GET, '/lanes/:id', "Returns the lane with the given id"
  desc "Returns the lane with the given id"
  param :id, :number, "Id of the Lane"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def show
    included = params[:include].try(:split, ",")
    id = params[:id]
    render json: Lane.find(id), include: included
  end
end
