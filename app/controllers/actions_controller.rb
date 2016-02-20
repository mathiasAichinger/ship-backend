class ActionsController < ApplicationController
  resource_description do
    formats [:json]
    short "API for managing actions"
  end

  api :GET, '/actions', "Returns all actions"
  desc "Returns all actions"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def index
    included = params[:include].try(:split, ",")
    render json: Action.all, include: included
  end
end
