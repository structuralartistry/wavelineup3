class AddPackageIdToPractice < ActiveRecord::Migration
  def change
    add_column :practices, :package_id, :integer
  end
end
