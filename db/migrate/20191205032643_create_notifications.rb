class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :message
      t.boolean :read

      t.timestamps
    end
    add_reference :notifications, :follower, foreign_key: true
    add_reference :notifications, :user, foreign_key: true
  end
end
