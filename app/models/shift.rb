class Shift < ApplicationRecord

  validates :worker_id, presence: true
  validates :start_time, presence: true

  belongs_to :worker
  belongs_to :office

  has_many :corrections, :class_name => 'Admin::ShiftCorrection', dependent: :nullify

  def duration
    if self.end_time.present?
      time_diff = (self.end_time - self.start_time)
      (time_diff / 1.minute).round(1)
    end
  end

end
