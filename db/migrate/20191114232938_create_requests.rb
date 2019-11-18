class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :requests, :user, foreign_key: true
    create_table :requests do |t|
      t.string :acc_type
      t.text :reason

      t.timestamps
    end
  end
end
