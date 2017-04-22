class LastSystemChangingsController < ApplicationController
  before_action :set_last_system_changing, only: [:show, :edit, :update, :destroy]

  # GET /last_system_changings
  # GET /last_system_changings.json
  def index
    @last_system_changings = LastSystemChanging.all
  end

  # GET /last_system_changings/1
  # GET /last_system_changings/1.json
  def show
  end

  # GET /last_system_changings/new
  def new
    @last_system_changing = LastSystemChanging.new
  end

  # GET /last_system_changings/1/edit
  def edit
  end

  # POST /last_system_changings
  # POST /last_system_changings.json
  def create
    @last_system_changing = LastSystemChanging.new(last_system_changing_params)

    respond_to do |format|
      if @last_system_changing.save
        format.html { redirect_to @last_system_changing, notice: 'Last system changing was successfully created.' }
        format.json { render :show, status: :created, location: @last_system_changing }
      else
        format.html { render :new }
        format.json { render json: @last_system_changing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /last_system_changings/1
  # PATCH/PUT /last_system_changings/1.json
  def update
    respond_to do |format|
      if @last_system_changing.update(last_system_changing_params)
        format.html { redirect_to @last_system_changing, notice: 'Last system changing was successfully updated.' }
        format.json { render :show, status: :ok, location: @last_system_changing }
      else
        format.html { render :edit }
        format.json { render json: @last_system_changing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /last_system_changings/1
  # DELETE /last_system_changings/1.json
  def destroy
    @last_system_changing.destroy
    respond_to do |format|
      format.html { redirect_to last_system_changings_url, notice: 'Last system changing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_last_system_changing
      @last_system_changing = LastSystemChanging.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def last_system_changing_params
      params.require(:last_system_changing).permit(:changing_date)
    end
end
