class OfficesController < ApplicationController
  include Pagination

  before_action :set_office, only: %i[ show edit update destroy ]

  # GET /offices or /offices.json
  def index
    authorize! :read, Office
    @offices = paginate Office
  end

  # GET /offices/1 or /offices/1.json
  def show
    authorize! :show, @office
  end

  # GET /offices/new
  def new
    authorize! :create, Office
    @office = Office.new
  end

  # GET /offices/1/edit
  def edit
    authorize! :update, @office
  end

  # POST /offices or /offices.json
  def create
    authorize! :create, Office
    @office = Office.new(office_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to office_url(@office), success: t("crud.controller.success.created", name: @office.name) }
        format.json { render :show, status: :created, location: @office }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offices/1 or /offices/1.json
  def update
    authorize! :update, @office

    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to office_url(@office), success: t("crud.controller.success.edited", name: @office.name) }
        format.json { render :show, status: :ok, location: @office }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1 or /offices/1.json
  def destroy
    authorize! :destroy, @office
    @office.destroy

    respond_to do |format|
      format.html { redirect_to offices_url, notice: t("crud.controller.success.deleted", name: @office.name) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def office_params
      params.require(:office).permit(:name, :description, :address_1, :address_2, :postcode, :city, :country)
    end
end
