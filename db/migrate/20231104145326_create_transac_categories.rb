class CreateTransacCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :transac_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :transac, null: false, foreign_key: true

      t.timestamps
    end
  end
end
