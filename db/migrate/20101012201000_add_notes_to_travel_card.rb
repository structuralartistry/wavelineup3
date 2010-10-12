class AddNotesToTravelCard < ActiveRecord::Migration
  def self.up
    add_column :travel_cards, :notes, :text
  end

  def self.down
    remove_column :travel_cards, :notes
  end
end
