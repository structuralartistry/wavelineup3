class CreateSystemErrors < ActiveRecord::Migration
  def self.up
    create_table :system_errors do |t|
      t.integer :user_id
      t.string :error
      t.text :incidentals

      t.timestamps
    end
  end

  def self.down
    drop_table :system_errors
  end
end
