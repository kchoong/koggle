class Shift < ApplicationRecord

  validates :worker_id, presence: true
  validates :start_time, presence: true

  belongs_to :worker
  belongs_to :office
end
