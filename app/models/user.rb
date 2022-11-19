class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A\w+@(\w+.)+\w+\Z/ }
  validates :firstname, presence: false
  validates :lastname, presence: false
  validates :birthday, presence: false

end
