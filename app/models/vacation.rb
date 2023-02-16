class Vacation < ApplicationRecord

  validates :worker_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :worker

end
