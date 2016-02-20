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

  api :GET, '/actions/:id', "Returns the action with the given id"
  desc "Returns the action with the given id"
  param :id, :number, "Id of the action"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def show
    included = params[:include].try(:split, ",")
    id = params[:id]
    render json: Action.find(id), include: included
  end
end
