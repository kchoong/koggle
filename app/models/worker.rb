class Worker < ApplicationRecord

  validates :pin, presence: true, uniqueness: true

  belongs_to :user, optional: true
  belongs_to :office, optional: true

  has_many :shifts, dependent: :nullify
  has_many :vacations, dependent: :nullify
  has_many :comments, as: :commentable

  has_one_attached :avatar do |attachable|
    attachable.variant :profile, resize_to_limit: [250, 250]
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :minithumb, resize_to_limit: [50, 50]
  end

  def name
    [first_name, last_name].compact.join(' ')
  end

  def full_address
    [address_1, address_2, city, postcode, country].compact.join(', ')
  end

end
