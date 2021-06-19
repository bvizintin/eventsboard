class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true, length: {minimum: 5}
end
