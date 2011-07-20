class CreateFeatureRequests < ActiveRecord::Migration
  def self.up
    create_table :feature_requests do |t|
      t.string :name
      t.text :description
      t.text :notes
      t.integer :times_requested
      t.date :date_implemented

      t.timestamps
    end
  end

  def self.down
    drop_table :feature_requests
  end
end
