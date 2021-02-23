class User < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy
  has_many :networks, dependent: :destroy
  accepts_nested_attributes_for :networks, reject_if: proc { |attributes| attributes['link'].blank? }, allow_destroy: true
  validates :name, presence: true
  validates :avatar, presence: true
  validates :username, presence: true, uniqueness: true
  validates :bio, presence: true

end
