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

  def show

  end
end
