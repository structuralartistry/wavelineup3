class CreatePracticeMembers < ActiveRecord::Migration
  def self.up
    create_table :practice_members do |t|
      t.integer :practice_id
      t.string :name_last
      t.string :name_first
      t.string :name_middle

      t.timestamps
    end
  end

  def self.down
    drop_table :practice_members
  end
end
