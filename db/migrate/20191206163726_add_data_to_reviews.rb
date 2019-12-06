class AddDataToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :stars, :integer
    add_reference :reviews, :user, null: false, foreign_key: true
    add_reference :reviews, :comic, null: false, foreign_key: true
  end
end
