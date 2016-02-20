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

  api :GET, '/builds/:id', "Returns the build with the given id"
  desc "Returns the build with the given id"
  param :id, :number, "Id of the Build"
  param :included, String, "Name of the related entities which should be included beside the base resource"

  def show
    included = params[:include].try(:split, ",")
    id = params[:id]
    render json: Build.find(id), include: included
  end

  def create
    clearedParams = build_params

    @build = Build.new(name: clearedParams[:name])
    @build.name = "Build" if @build.name.nil? || @build.name.empty?
    @build.startDate = Time.now
    @build.status = "pending"


    app = App.find(clearedParams[:app_id])
    @build.app = app

    lane_template = LaneTemplate.find(clearedParams[:lane_template_id])



    lane = Lane.new
    lane.lane_template = lane_template
    actions = []

    lane_template.action_templates.each do |template|
      action = Action.new
      action.action_template = template
      action.save
      actions << action

    end

    lane.actions = actions
    lane.save
    @build.lane = lane
    @build.save

    if @build.save
      render json: @build, status: :created
    else
      render json: {errors: @build.errors}, status: :unprocessable_entity
    end
  end

  api :DELETE, '/build/:id', "Deletes the given build"
  param :id, :number, "Id of the Build"
  def destroy
    id = params[:id]
    @build = Build.find_by(id: id)
    unless @build.nil?
      @build.destroy
      render :nothing => true, status: :no_content
    else
      render json: {errors: "Record not found"}, status: :not_found
    end
  end

  def build_params
    params.require(:data).require(:attributes).permit(:name, :app_id, :lane_template_id)
  end
end
