class User < ApplicationRecord
  has_one_attached :avatar

  validates :name, presence: true
  validates :avatar, presence: true
  validates :username, presence: true, uniqueness: true
  validates :bio, presence: true

end
