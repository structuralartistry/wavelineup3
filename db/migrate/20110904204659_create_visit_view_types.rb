class CreateVisitViewTypes < ActiveRecord::Migration
  def change
    add_column :visits, :visit_view_type_id, :integer

    create_table :visit_view_types do |t|
      t.string :name

      t.timestamps
    end

    standard_view_type = VisitViewType.create!(:name => 'standard')
    VisitViewType.create!(:name => 'soap')

    Visit.all.each {|v| v.update_attributes(:visit_view_type_id => standard_view_type.id)}
  end
end
