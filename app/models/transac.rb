class Transac < ApplicationRecord
  attr_accessor :category_id

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true
end
