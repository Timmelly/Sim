class ComputerStatusesController < ApplicationController
  before_action :set_computer_status, only: [:show, :edit, :update, :destroy]

  # GET /computer_statuses
  # GET /computer_statuses.json
  def index
    @computer_statuses = ComputerStatus.all
  end

  # GET /computer_statuses/1
  # GET /computer_statuses/1.json
  def show
  end

  # GET /computer_statuses/new
  def new
    @computer_status = ComputerStatus.new
  end

  # GET /computer_statuses/1/edit
  def edit
  end

  # POST /computer_statuses
  # POST /computer_statuses.json
  def create
    @computer_status = ComputerStatus.new(computer_status_params)

    respond_to do |format|
      if @computer_status.save
        format.html { redirect_to @computer_status, notice: 'Computer status was successfully created.' }
        format.json { render :show, status: :created, location: @computer_status }
      else
        format.html { render :new }
        format.json { render json: @computer_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computer_statuses/1
  # PATCH/PUT /computer_statuses/1.json
  def update
    respond_to do |format|
      if @computer_status.update(computer_status_params)
        format.html { redirect_to @computer_status, notice: 'Computer status was successfully updated.' }
        format.json { render :show, status: :ok, location: @computer_status }
      else
        format.html { render :edit }
        format.json { render json: @computer_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computer_statuses/1
  # DELETE /computer_statuses/1.json
  def destroy
    @computer_status.destroy
    respond_to do |format|
      format.html { redirect_to computer_statuses_url, notice: 'Computer status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer_status
      @computer_status = ComputerStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_status_params
      params.require(:computer_status).permit(:status, :users, :computer_id)
    end
end
