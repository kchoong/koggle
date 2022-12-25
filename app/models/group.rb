class Group < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: false

  has_many :users
  has_many :comments, as: :commentable

end
