# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


for i in 0..2000 do
    Reference.create(references_text: "author#{i}.referencetext#{i}")
 end
 
 for i in 0..2000 do
    GrothendieckSitesCategory.create(grothendieck_sites_description: "grothendieck_sites_description#{i}",grothendieck_topologies: "grothendieck_topologies#{i}", underlying_rings_category: "underlying_rings_category#{i}")
 end
 
 for i in 0..2000 do
    StacksAsTheSheavesCategory.create(stacks_as_the_sheaves_categories_description: "stacks_as_the_sheaves_categories_description#{i}", stacks_as_the_sheaves_categories_target_categories: "stacks_as_the_sheaves_categories_target_categories#{i}", stacks_as_the_sheaves_categories_over_topologies_can_be_realized: "stacks_as_the_sheaves_categories_over_topologies_can_be_realized#{i}", sheafification_from_the_prestacks_as_the_presheaves_category: "sheafification_from_the_prestacks_as_the_presheaves_category#{i}")
 end


 
