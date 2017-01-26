class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :update, :destroy]

  # GET /folders
  def index
    service = Service.find_by(id: params[:service_id], user_id: params[:user_id])
    @folders = service.folders.all

    render json: @folders, user_id: params[:user_id]
  end

  # GET /folders/1
  def show
    render json: @folder, user_id: params[:user_id]
  end

  # POST /folders
  def create
    service = Service.find_by(id: params[:service_id], user_id: params[:user_id])
    @folder = service.folders.new(folder_params)

    if @folder.save
      render json: @folder, user_id: params[:user_id], status: :created, location: @folder
    else
      render json: @folder.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /folders/1
  def update
    if @folder.update(folder_params)
      render json: @folder, user_id: params[:user_id]
    else
      render json: @folder.errors, status: :unprocessable_entity
    end
  end

  # DELETE /folders/1
  def destroy
    @folder.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      service = Service.find_by(id: params[:service_id], user_id: params[:user_id])
      @folder = service.folders.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def folder_params
      params.require(:folder).permit(:name, :folder_path, :dirty_flag, :service_folder_id, :parent_id)
    end
end
