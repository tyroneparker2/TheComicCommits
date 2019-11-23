class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :comic_file
      t.string :isbn
      t.string :genre

      t.timestamps
    end
    remove_column :comics, :comic_file
  end
end
