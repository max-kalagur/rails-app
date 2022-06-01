class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.references :movie, index: true, foreign_key: true, on_delete: :cascade
      t.references :user, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
