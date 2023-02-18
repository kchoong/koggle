Rails.configuration.after_initialize do
  # Close all active working shifts on startup
  active_shifts = Shift.where(end_time: nil)
  active_shifts.each do |work_shift|
    work_shift.update!(end_time: DateTime.now)
  end
end