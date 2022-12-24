class Organization < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: false

  has_many :persons
  has_many :comments, as: :commentable

end
