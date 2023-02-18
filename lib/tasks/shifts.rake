namespace :shifts do
  desc "Close all currently active work shifts."
  task close_all_active: :environment do
    active_shifts = Shift.where(end_time: nil)
    active_shifts.each do |work_shift|
      work_shift.update!(end_time: DateTime.now)
    end
  end
end
