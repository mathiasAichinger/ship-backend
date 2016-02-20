class BuildsController < ApplicationController
  resource_description do
    formats [:json]
    short "API for managing builds"
  end

  api :GET, '/builds', "Returns all builds"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def index
    included = params[:include].try(:split, ",")
    render json: Build.all, include: included
  end

end
