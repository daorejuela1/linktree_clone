# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  validate :correct_file_mime_type
  has_many :networks, dependent: :destroy
  accepts_nested_attributes_for :networks, reject_if: proc { |attributes|
                                                        attributes['link'].blank?
                                                      }, allow_destroy: true
  validates :name, presence: true
  validates :avatar, presence: true
  validates :username, presence: true, uniqueness: true
  validates :bio, presence: true

  private

  def correct_file_mime_type
    if avatar.attached? && !avatar.image?
      avatar.purge if avatar.persisted?
      errors.add(:avatar, 'Image must be a JPG or PNG file')
    end
  end
end
