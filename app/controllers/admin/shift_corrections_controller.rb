class Admin::ShiftCorrectionsController < ApplicationController
  before_action :set_admin_shift_correction, only: %i[ show edit update destroy ]

  # GET /admin/shift_corrections or /admin/shift_corrections.json
  def index
    @admin_shift_corrections = Admin::ShiftCorrection.all
  end

  # GET /admin/shift_corrections/1 or /admin/shift_corrections/1.json
  def show
  end

  # GET /admin/shift_corrections/new
  def new
    @admin_shift_correction = Admin::ShiftCorrection.new
  end

  # GET /admin/shift_corrections/1/edit
  def edit
  end

  # POST /admin/shift_corrections or /admin/shift_corrections.json
  def create
    @admin_shift_correction = Admin::ShiftCorrection.new(admin_shift_correction_params)

    respond_to do |format|
      if @admin_shift_correction.save
        format.html { redirect_to admin_shift_correction_url(@admin_shift_correction), notice: "Shift correction was successfully created." }
        format.json { render :show, status: :created, location: @admin_shift_correction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_shift_correction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/shift_corrections/1 or /admin/shift_corrections/1.json
  def update
    respond_to do |format|
      if @admin_shift_correction.update(admin_shift_correction_params)
        format.html { redirect_to admin_shift_correction_url(@admin_shift_correction), notice: "Shift correction was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_shift_correction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_shift_correction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/shift_corrections/1 or /admin/shift_corrections/1.json
  def destroy
    @admin_shift_correction.destroy

    respond_to do |format|
      format.html { redirect_to admin_shift_corrections_url, notice: "Shift correction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_shift_correction
      @admin_shift_correction = Admin::ShiftCorrection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_shift_correction_params
      params.require(:admin_shift_correction).permit(:description)
    end
end
