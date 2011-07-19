class CreateLogins < ActiveRecord::Migration
  def self.up
    create_table :logins do |t|
      t.string :email
      t.integer :user_id
      t.boolean :success

      t.timestamps
    end
  end

  def self.down
    drop_table :logins
  end
end
