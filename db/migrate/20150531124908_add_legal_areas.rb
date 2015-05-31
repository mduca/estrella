class AddLegalAreas < ActiveRecord::Migration
  def change
		add_column :paths, :legal_areas, :string
		add_column :paths, :legal_services, :string
  end
end
