class Admin::ShiftCorrection < ApplicationRecord

  validates :editor, presence: true
  validates :description, presence: true

  belongs_to :shift, optional: false

end
