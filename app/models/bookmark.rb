class Bookmark < ApplicationRecord
  belongs_to :user

  validates_associated :user
  validates :user, presence: true
  validates :ayah_key, presence: true, uniqueness: true, format: { with: %r{[0-9]:[0-9]} }
end
