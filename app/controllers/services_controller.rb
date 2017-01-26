class ServicesController < ApplicationController
  # before_action :authenticate_user
  before_action :set_service, only: [:show, :update, :destroy]


  # GET /services
  def index
    @services = Service.where(user_id: params[:user_id])
    render json: @services
  end

  # GET /services/1
  def show
    render json: @service
  end

  # POST /services
  def create
    current_user = User.find(params[:user_id])
    @service = current_user.services.new(service_params)

    if @service.save
      render json: @service, status: :created, location: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /services/1
  def update
    if @service.update(service_params)
      render json: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.where(id: params[:id], user_id: params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def service_params
      params.require(:service).permit(:name, :access_token, :used_space, :total_space)
    end
end
