class CreatePracticeMembers < ActiveRecord::Migration
  def self.up
    create_table :practice_members do |t|
      t.integer :practice_id
      t.string :last_name
      t.string :first_name
      t.string :middle_name

      t.timestamps
    end
  end

  def self.down
    drop_table :practice_members
  end
end
