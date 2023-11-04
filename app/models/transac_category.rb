class TransacCategory < ApplicationRecord
  belongs_to :category, class_name: 'Category'
  belongs_to :transac, class_name: 'Transac', foreign_key: 'transac_id'
end
