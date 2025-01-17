class CurrenciesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_account!

  before_action :set_currency, only: %i[ show edit update destroy ]
  layout "dashboard"
  # GET /currencies or /currencies.json
  def index
    @currencies = Currency.all
  end

  # GET /currencies/1 or /currencies/1.json
  def show
  end

  # GET /currencies/new
  def new
    @currency = Currency.new
  end

  # GET /currencies/1/edit
  def edit
  end

  # POST /currencies or /currencies.json
  def create
    @currency = current_account.currencies.build(currency_params)

    respond_to do |format|
      if @currency.save
         @currencies = Currency.all
        format.html { redirect_to currency_url(@currency), notice: "Currency was successfully created." }
        format.json { render :show, status: :created, location: @currency }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /currencies/1 or /currencies/1.json
  def update
    respond_to do |format|
      if @currency.update(currency_params)
         @currencies = Currency.all
        format.html { redirect_to currency_url(@currency), notice: "Currency was successfully updated." }
        format.json { render :show, status: :ok, location: @currency }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @currency = Currency.find_by(uid: params[:currency_id])
  end

  # DELETE /currencies/1 or /currencies/1.json
  def destroy
    @currency.destroy

    respond_to do |format|
      format.html { redirect_to currencies_url, notice: "Currency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def currency_params
      params.require(:currency).permit(:uid, :name, :iso_code, :symbol, :decimal_symbol, :symbol_position, :thousand_separator, :status)
    end
end
