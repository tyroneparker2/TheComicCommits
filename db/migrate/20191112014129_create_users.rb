class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :group
      t.string :username
      t.string :email
      t.string :password
      t.string :security_q
      t.string :security_a
      t.string :bio
      t.string :recommendations
      t.string :admin_code

      t.timestamps
    end
  end
end
