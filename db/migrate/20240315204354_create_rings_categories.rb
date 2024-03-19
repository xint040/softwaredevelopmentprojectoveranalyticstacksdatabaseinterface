class CreateRingsCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :rings_categories do |t|
      t.string :rings_categories_description
      t.string :rings_categories_charactaristics
      t.string :indseminormed
      t.string :indnormed
      t.string :indBanach
      t.string :monomorphicindseminormed
      t.string :monomorphicindnormed
      t.string :monomorphicindBanach
      t.string :condensed
      t.string :Clausen_Scholze_analytic_1_more_adic_style
      t.string :Clausen_Scholze_analytic_2_more_categorical_flavor
      t.string :adic
      t.string :perfectoid
      t.string :topologies_on_the_rings

      t.timestamps
    end
  end
end
