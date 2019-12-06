class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      #t.string :type
      t.string :title
      t.text :text
      #t.integer :rating
      #t.integer :replied_to

      t.timestamps
    end
  end
end
