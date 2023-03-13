class Office < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :workers, dependent: :nullify
  has_many :shifts, dependent: :nullify
  has_many :comments, as: :commentable

  def full_address
    [address_1, address_2, postcode, city, country].compact.join(', ')
  end

end
