class Admin::ShiftCorrectionsController < ApplicationController
  include Pagination

  before_action :set_shift, only: %i[ edit_shift update_shift ]

  # GET /admin/shift_corrections or /admin/shift_corrections.json
  def index
    @shift_corrections = paginate Admin::ShiftCorrection, :id, :asc
  end

  # GET /admin/shift_corrections/edit_shift/1
  def edit_shift

  end

  # POST /admin/shift_corrections/update_shift/1
  def update_shift
    @shift.update!(shift_params)
    correction = Admin::ShiftCorrection.new(correction_params.merge(shift: @shift))
    correction.save!
    redirect_to shift_url(@shift), success: t("crud.controller.success.edited", name: @shift.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    def shift_params
      params.require(:shift).permit(:start_time, :end_time)
    end

  def correction_params
    params.require(:correction).permit(:editor, :description)
  end

end
