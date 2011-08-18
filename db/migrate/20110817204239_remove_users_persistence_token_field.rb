class RemoveUsersPersistenceTokenField < ActiveRecord::Migration
  def up
    remove_column :users, :persistence_token
  end

  def down
  end
end
