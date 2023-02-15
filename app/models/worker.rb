class Worker < ApplicationRecord
  validates :last_name, presence: true

  belongs_to :user, optional: true
  belongs_to :office, optional: true

  def name
    [first_name, last_name].compact.join(' ')
  end

  def full_address
    [address_1, address_2, city, postcode, country].compact.join(', ')
  end

end
