class Person < ApplicationRecord

  validates :title, presence: false
  validates :firstname, presence: false
  validates :lastname, presence: true
  validates :gender, presence: false
  validates :birthday, presence: false
  validates :profession, presence: false

  belongs_to :organization, optional: true

  has_many :comments, as: :commentable

  def name
    if firstname.present?
      "#{firstname} #{lastname}"
    else
      "#{lastname}"
    end
  end

end
