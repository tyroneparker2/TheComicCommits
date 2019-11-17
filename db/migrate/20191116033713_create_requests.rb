class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :acc_type
      t.string :reason

      t.timestamps
    end
    add_reference :requests, :user, foreign_key: true
  end
end
