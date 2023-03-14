module ShiftsHelper

  def get_active_shifts(worker)
    Shift.where(worker: worker, end_time: nil)
  end

  def get_shifts_current_week(worker)
    start_time = DateTime.now.beginning_of_week
    end_time = DateTime.now.end_of_week
    Shift.where(worker: worker, start_time: start_time .. end_time).and(Shift.where.not(end_time: nil))
  end

  def sum_duration(shifts)
    shifts.to_a.sum(&:duration)
  end

end
