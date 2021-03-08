# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]*\z/.freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  validate :add_default_image
  validate :correct_file_mime_type
  has_many :networks, dependent: :destroy
  accepts_nested_attributes_for :networks, reject_if: proc { |attributes|
                                                        attributes['link'].blank?
                                                      }, allow_destroy: true
  validates :name, presence: true,length: { maximum: 50 }
  validates :username, presence: true, uniqueness: {case_sensitive: false}, format: { with: VALID_USERNAME_REGEX }
  validates :email, presence: true, uniqueness: {case_sensitive: false}, email: true
  validate :validate_email_layers

  private

  def validate_email_layers
    errors.add(:email, 'Invalid Email') if !Truemail.valid?(email)
  end

  def add_default_image
    if !avatar.attached?
      avatar.attach(io: File.open('/home/vagrant/task1/linktree_clone/app/assets/images/default.png'), filename: 'default.png')
    end
  end
  def correct_file_mime_type
    if avatar.attached? && !avatar.image?
      avatar.purge if avatar.persisted?
      errors.add(:avatar, 'Image must be a JPG or PNG file')
    end
  end
end
