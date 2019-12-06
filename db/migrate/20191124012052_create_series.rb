class CreateSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :series do |t|
      t.string :title

      t.timestamps
    end
    add_reference :comics, :series, foreign_key: true
    add_reference :series, :user, foreign_key: true
  end
end
