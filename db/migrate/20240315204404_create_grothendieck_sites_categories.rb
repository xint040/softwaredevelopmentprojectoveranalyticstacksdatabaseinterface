class CreateGrothendieckSitesCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :grothendieck_sites_categories do |t|
      t.string :grothendieck_sites_description
      t.string :grothendieck_topologies
      t.string :underlying_rings_category

      t.timestamps
    end
  end
end
