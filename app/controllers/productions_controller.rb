class ProductionsController < ApplicationController
  before_action :set_production, only: %i[ show edit update destroy ]

  before_action :authenticate_account!
  layout "dashboard"



  # GET /productions or /productions.json
  def index
    @productions = Production.order(created_at: :desc)
  end

  # GET /productions/1 or /productions/1.json
  def show
  end

  # GET /productions/new
  def new
    @production = Production.new
  end

  # GET /productions/1/edit
  def edit
  end

  # POST /productions or /productions.json
  def create
    @production = current_account.productions.build(production_params)

    respond_to do |format|
      if @production.save
        @productions = Production.all
        format.html { redirect_to production_url(@production), notice: "Production was successfully created." }
        format.json { render :show, status: :created, location: @production }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productions/1 or /productions/1.json
  def update
    respond_to do |format|
      if @production.update(production_params)
        @productions = Production.all
        format.html { redirect_to production_url(@production), notice: "Production was successfully updated." }
        format.json { render :show, status: :ok, location: @production }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @production.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @production = Production.find_by(uid: params[:production_id])
    end


  # DELETE /productions/1 or /productions/1.json
  def destroy
    @production.destroy

    respond_to do |format|
      format.html { redirect_to productions_url, notice: "Production was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production
      @production = Production.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def production_params
      params.require(:production).permit(:production_date,  :b3_number, :b3_tonnage, :b6_number, :b6_tonnage, :b12_number, :b12_tonnage, :b32_number, :b32_tonnage, :b38_number, :b38_tonnage, :total_tonnage)
    end
end
