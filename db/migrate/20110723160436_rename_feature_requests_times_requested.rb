class RenameFeatureRequestsTimesRequested < ActiveRecord::Migration
  def self.up
    rename_column :feature_requests, :times_requested, :popularity_priority_index
  end

  def self.down
    rename_column :feature_requests, :popularity_priority_index, :times_requested
  end
end
