class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :user, foreign_key: true
      t.references :following, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
