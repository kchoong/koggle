class Profile < ApplicationRecord

  validates :title, presence: false
  validates :firstname, presence: false
  validates :lastname, presence: false
  validates :gender, presence: false
  validates :birthday, presence: false
  validates :occupation, presence: false

  belongs_to :user
  has_many :comments, as: :commentable

  def name
    if firstname.present?
      "#{firstname} #{lastname}"
    else
      "#{lastname}"
    end
  end

end
