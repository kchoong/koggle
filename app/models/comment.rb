class Comment < ApplicationRecord

  validates :name, presence: false
  validates :text, presence: true

  belongs_to :commentable, polymorphic: true

end
