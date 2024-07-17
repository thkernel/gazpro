class TanksController < ApplicationController
  before_action :set_tank, only: %i[ show edit update destroy ]


  before_action :authenticate_account!
  layout "dashboard"



  # GET /tanks or /tanks.json
  def index
    @tanks = Tank.all
  end

  # GET /tanks/1 or /tanks/1.json
  def show
  end

  # GET /tanks/new
  def new
    @unities = Unity.all
    @tank = Tank.new
  end

  # GET /tanks/1/edit
  def edit
    @unities = Unity.all
  end

  # POST /tanks or /tanks.json
  def create
    @tank = current_account.tanks.build(tank_params)

    respond_to do |format|
      if @tank.save
        @tanks = Tank.all
        format.html { redirect_to tanks_path, notice: "Tank was successfully created." }
        format.json { render :show, status: :created, location: @tank }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /tanks/1 or /tanks/1.json
  def update
    respond_to do |format|
      if @tank.update(tank_params)
        @unities = Unity.all
        format.html { redirect_to tank_url(@tank), notice: "Tank was successfully updated." }
        format.json { render :show, status: :ok, location: @tank }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @tank = Tank.find_by(uid: params[:tank_id])
    end

  # DELETE /tanks/1 or /tanks/1.json
  def destroy
    @tank.destroy

    respond_to do |format|
      format.html { redirect_to tanks_url, notice: "Tank was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tank
      @tank = Tank.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tank_params
      params.require(:tank).permit(:registration_number, :brand, :model, :capacity, :unity_id)
    end
end
