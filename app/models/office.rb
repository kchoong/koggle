class Office < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :workers, dependent: :nullify

  def full_address
    [address_1, address_2, postcode, city, country].compact.join(', ')
  end

end
