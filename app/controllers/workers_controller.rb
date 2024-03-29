class WorkersController < ApplicationController
  include Pagination

  before_action :set_worker, only: %i[ show edit update destroy ]

  # GET /workers or /workers.json
  def index
    authorize! :read, Worker
    @workers = paginate Worker
  end

  # GET /workers/1 or /workers/1.json
  def show
    authorize! :show, @worker
  end

  # GET /workers/new
  def new
    authorize! :create, Worker
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
    authorize! :update, @worker
  end

  # POST /workers or /workers.json
  def create
    authorize! :create, Worker
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to worker_url(@worker), success: t("crud.controller.success.created", name: @worker.name) }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1 or /workers/1.json
  def update
    authorize! :update, @worker

    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to worker_url(@worker), success: t("crud.controller.success.edited", name: @worker.name) }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1 or /workers/1.json
  def destroy
    authorize! :destroy, @worker
    @worker.destroy

    respond_to do |format|
      format.html { redirect_to workers_url, notice: t("crud.controller.success.deleted", name: @worker.name) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def worker_params
      params.require(:worker).permit(:first_name, :last_name, :birthday, :address_1, :address_2, :city, :country, :postcode, :work_hours, :vacation_days, :avatar)
    end
end
