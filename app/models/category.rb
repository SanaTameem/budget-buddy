class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :transac_categories
  has_many :transacs, through: :transac_categories
  validates :name, presence: true
  validates :icon, presence: true
end
