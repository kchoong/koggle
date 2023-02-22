class Vacation < ApplicationRecord

  validates :worker_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :worker

  def duration
    if self.end_date.present?
      (self.end_date - self.start_date).to_int
    end
  end

end
