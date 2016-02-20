class ActionTemplatesController < ApplicationController
  resource_description do
    formats [:json]
    short "API for managing action templates"
  end

  api :GET, '/actions_templates', "Returns all action templates"
  desc "Returns all action templates"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def index
    included = params[:include].try(:split, ",")
    render json: ActionTemplate.all, include: included
  end

  api :GET, '/action_templates/:id', "Returns the action_template with the given id"
  desc "Returns the action_template with the given id"
  param :id, :number, "Id of the Action Template"
  param :included, String, "Name of the related entities which should be included beside the base resource"
  def show
    included = params[:include].try(:split, ",")
    id = params[:id]
    render json: ActionTemplate.find(id), include: included
  end
end
