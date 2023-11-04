class AddCategoryIdToTransacs < ActiveRecord::Migration[7.0]
  def change
    add_reference :transacs, :category, null: false, foreign_key: true
  end
end
