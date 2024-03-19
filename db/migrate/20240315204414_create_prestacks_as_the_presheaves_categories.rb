class CreatePrestacksAsThePresheavesCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :prestacks_as_the_presheaves_categories do |t|
      t.string :prestacks_as_the_presheaves_categories_description
      t.string :prestacks_as_the_presheaves_categories_target_categories
      t.string :underlying_grothendieck_sites_category

      t.timestamps
    end
  end
end
