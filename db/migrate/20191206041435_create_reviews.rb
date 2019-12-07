class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :text
      #t.integer :stars
      #t.references :comic, null: false, foreign_key: true
      #t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
