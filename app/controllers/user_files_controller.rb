class UserFilesController < ApplicationController
  before_action :get_folder
  before_action :set_user_file, only: [:show, :update, :destroy]

  # GET /user_files
  def index
    @user_files = @folder.user_files.all
    render json: @user_files, user_id: params[:user_id]
  end

  # GET /user_files/1
  def show
    render json: @user_file, user_id: params[:user_id]
  end

  # POST /user_files
  def create
    @user_file = @folder.user_files.new(user_file_params)

    if @user_file.save
      render json: @user_file, user_id: params[:user_id], status: :created, location: @user_file
    else
      render json: @user_file.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_files/1
  def update
    if @user_file.update(user_file_params)
      render json: @user_file, user_id: params[:user_id]
    else
      render json: @user_file.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_files/1
  def destroy
    @user_file.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_file
      @user_file = @folder.user_files.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_file_params
      params.require(:user_file).permit(:name, :folder_path, :service_file_id)
    end

    def get_folder
      service = Service.find_by(id: params[:service_id], user_id: params[:user_id])
      @folder = service.folders.find(params[:folder_id])
    end
end
