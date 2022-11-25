class Group < ApplicationRecord

  validates :groupname, presence: true, uniqueness: true
  validates :title, presence: false
  validates :description, presence: false

  has_many :users
  has_many :comments, as: :commentable

  def name
    "#{groupname}"
  end

end