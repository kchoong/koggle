class VacationsController < ApplicationController
  include Pagination

  before_action :set_vacation, only: %i[ show edit update destroy ]

  # GET /vacations or /vacations.json
  def index
    @vacations = paginate Vacation, :start_date, :desc
  end

  # GET /vacations/1 or /vacations/1.json
  def show
  end

  # GET /vacations/new
  def new
    @vacation = Vacation.new
  end

  # GET /vacations/1/edit
  def edit
  end

  # POST /vacations or /vacations.json
  def create
    @vacation = Vacation.new(vacation_params)

    respond_to do |format|
      if @vacation.save
        format.html { redirect_to vacation_url(@vacation), success: t("crud.controller.success.created", name: Vacation.model_name.human) }
        format.json { render :show, status: :created, location: @vacation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacations/1 or /vacations/1.json
  def update
    respond_to do |format|
      if @vacation.update(vacation_params)
        format.html { redirect_to vacation_url(@vacation), success: t("crud.controller.success.edited", name: Vacation.model_name.human) }
        format.json { render :show, status: :ok, location: @vacation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacations/1 or /vacations/1.json
  def destroy
    @vacation.destroy

    respond_to do |format|
      format.html { redirect_to vacations_url, notice: t("crud.controller.success.deleted", name: Vacation.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation
      @vacation = Vacation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacation_params
      params.require(:vacation).permit(:start_date, :end_date, :worker_id)
    end
end
