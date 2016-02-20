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
end
