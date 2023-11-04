class Transac < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :transac_categories
  has_many :categories, through: :transac_categories
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
