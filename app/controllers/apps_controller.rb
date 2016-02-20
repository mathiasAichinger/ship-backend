class AppsController < ApplicationController
  resource_description do
    formats [:json]
    short "API for managing apps"
  end

  api :GET, '/apps', "Returns all apps"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def index
    included = params[:include].try(:split, ",")
    render json: App.all, include: included
  end

  api :GET, '/apps/:id', "Returns the app with the given id"
  desc "Returns the app with the given id"
  param :id, :number, "Id of the App"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def show
    included = params[:include].try(:split, ",")
    id = params[:id]
    render json: App.find(id), include: included
  end

end
