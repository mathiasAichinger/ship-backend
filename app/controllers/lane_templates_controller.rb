class LaneTemplatesController < ApplicationController
  resource_description do
    formats [:json]
    short "API for managing lane templates"
  end

  api :GET, '/lane_templates', "Returns all lane templates"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def index
    included = params[:include].try(:split, ",")
    render json: LaneTemplate.all, include: included
  end
end
