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
    @app = App.find_by(id: id)
    if @app.nil?
      render json: {errors: "Record not found"}, status: :not_found
    else
      render json: @app, include: included
    end
  end

  api :POST, '/apps', "Creates a new app"
  def create
    @app = App.new(app_params)
    @app.lane_templates << LaneTemplate.find(1)
    @app.lane_templates << LaneTemplate.find(2)
    if @app.save
      render json: @app, status: :created
    else
      render json: {errors: @app.errors}, status: :unprocessable_entity
    end
  end

  def update
    @app = App.find_by(id: params[:id])
    unless @app
      render json: {:errors => ["Ressouce not found"]}, status: :not_found
      return
    end

    @app.attributes = app_params
    puts "-------------------------".green
    puts app_params
    puts "-------------------------".green

    if @app.save
      render json: @app
    else
      render json: {errors: @app.errors}, status: :unprocessable_entity
    end
  end

  api :DELETE, '/apps/:id', "Deletes the given app"
  param :id, :number, "Id of the App"
  def destroy
    id = params[:id]
    @app = App.find_by(id: id)
    unless @app.nil?
      @app.destroy
      render :nothing => true, status: :no_content
    else
      render json: {errors: "Record not found"}, status: :not_found
    end
  end

  private
  def app_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
