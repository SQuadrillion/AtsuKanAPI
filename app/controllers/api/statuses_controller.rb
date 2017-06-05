class Api::StatusesController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  before_action :set_status, only: [:show, :update, :destroy]

  # GET /statuses
  def index
    @statuses = Status.where('id = ?', params[:id])
    render json: @statuses
  end

  # GET /statuses/1
  def show
    render json: @status
  end

  # POST /statuses
  def create
    json_request = JSON.parse(request.body.read)
    data = Status.where('id = ?', json_request["id"])

    if !json_request.blank?
      personal = json_request
      Status.update(hot: data[0].hot += json_request["hot"].to_i, cold: data[0].cold += json_request["cold"].to_i)
    else
      personal = { 'status' => 200 }
    end
    
    render json: personal
  end

  # PATCH/PUT /statuses/1
  def update
    if @status.update(status_params)
      render json: @status
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /statuses/1
  def destroy
    @status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_params
      params.require(:status).permit(:hot, :cold)
    end
end
