class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :acc_type
      t.string :resaon

      t.timestamps
    end
  end
end
