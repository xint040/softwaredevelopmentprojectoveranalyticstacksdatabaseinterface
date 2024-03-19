class CreateStacksAsTheSheavesCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :stacks_as_the_sheaves_categories do |t|
      t.string :stacks_as_the_sheaves_categories_description
      t.string :stacks_as_the_sheaves_categories_target_categories
      t.string :stacks_as_the_sheaves_categories_over_topologies_can_be_realized
      t.string :sheafification_from_the_prestacks_as_the_presheaves_category

      t.timestamps
    end
  end
end
