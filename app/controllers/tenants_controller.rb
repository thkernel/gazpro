class TenantsController < ApplicationController
  #authorize_resource
  load_and_authorize_resource
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_tenant, only: %i[ show edit update destroy ]

  # GET /tenants or /tenants.json
  def index
    @tenants = Tenant.order(id: :desc)
  end

  # GET /tenants/1 or /tenants/1.json
  def show
  end

  # GET /tenants/new
  def new
    @countries = Country.all
    @tenant = Tenant.new
  end

  # GET /tenants/1/edit
  def edit
    @countries = Country.all
  end

  # POST /tenants or /tenants.json
  def create
    @tenant = current_account.tenants.build(tenant_params)

    respond_to do |format|
      if @tenant.save
        @tenants = Tenant.order(id: :desc)
        format.html { redirect_to @tenant, notice: "Tenant was successfully created." }
        format.json { render :show, status: :created, location: @tenant }
        format.js
      else
        @organization_types = OrganizationType.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /tenants/1 or /tenants/1.json
  def update
    respond_to do |format|
      if @tenant.update(tenant_params)
        @tenants = Tenant.order(id: :desc)
        format.html { redirect_to @tenant, notice: "Tenant was successfully updated." }
        format.json { render :show, status: :ok, location: @tenant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @tenant = Tenant.find_by(uid: params[:tenant_id])
  end

  # DELETE /tenants/1 or /tenants/1.json
  def destroy
    @tenant.destroy
    respond_to do |format|
      delete_tenant(@tenant.subdomain.downcase)
      format.html { redirect_to tenants_url, notice: "Tenant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find_by(uid: params[:id])
    end

    def delete_tenant(tenant_name)
      Apartment::Tenant.drop(tenant_name)

    end


    # Only allow a list of trusted parameters through.
    def tenant_params
      params.require(:tenant).permit(:social_reason, :name, :address, :phone, :country_id, :city, :email, :website, :subdomain, :status)
    end
end
