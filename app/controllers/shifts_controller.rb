class ShiftsController < ApplicationController
  include Pagination

  before_action :set_shift, only: %i[ show edit update destroy ]

  # GET /shifts or /shifts.json
  def index
    authorize! :read, Shift
    @shifts = paginate Shift, :start_time, :desc
  end

  # GET /shifts/1 or /shifts/1.json
  def show
    authorize! :show, @shift
  end

  # GET /shifts/new
  def new
    authorize! :create, Shift
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
    authorize! :update, @shift
  end

  # POST /shifts or /shifts.json
  def create
    authorize! :create, Shift
    @shift = Shift.new(shift_params)

    respond_to do |format|
      if @shift.save
        format.html { redirect_to shift_url(@shift), success: t("crud.controller.success.created", name: Shift.model_name.human) }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1 or /shifts/1.json
  def update
    authorize! :update, @shift

    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to shift_url(@shift), success: t("crud.controller.success.edited", name: Shift.model_name.human) }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1 or /shifts/1.json
  def destroy
    authorize! :destroy, @shift
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to shifts_url, notice: t("crud.controller.success.deleted", name: Shift.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shift_params
      params.require(:shift).permit(:start_time, :end_time, :worker_id, :office_id)
    end
end
