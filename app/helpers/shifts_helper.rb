module ShiftsHelper

  def get_active_shifts(worker)
    Shift.where(worker: worker, end_time: nil)
  end

end
