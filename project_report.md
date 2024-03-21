## Notice

This software repository is prepared for CSCE 608 Course Project 1, which is a specialization just for the homework submission. This means that there might be very possibly mistakes. We do not claim complete correctness for the code and the development thread scheduling, along all the process of our development including all the commits and branches. Therefore if you want to follow the prototype to get the inspiration for your own development, we cannot claim that everything is correct. Therefore the most correct way to follow this repository is to run BDD-related verification, testings and even prove everything is okay in mathematical sense. We will also appreciate it very much if you can let us know if you find any mistakes. 




## Xin Tong
## Project Framework: Ruby on Rails
## Project Name: Software Development on Analytic Stacks Database Interface



## Project Introduction


We first use the following formal language to give the corresponding presentations of the foundations in |11| where the author is the developer of this software. The current status of the software syncronizes foundations of certain modern analytification of (infinite,1)-categorical Grothendieck fibrations. The starting point goes from Scholze's diamonds and the further generalization to the so-called v-stacks |9|. Scholze then came up with the idea of condensation due to the nature of perfectoid algebras |10|, |16|, |17|, i.e. totally disconnectedness in the p-adic world. This 
significant consideration leads to the corresponding analytic stacks of Clausen-Scholze in two flavors |5|, |6|, |7|. Bambozzi-Ben-Bassat-Kremnizer on the other hands touches the foundations of functional analytification from a more Banach spaces aspect, which is not certainly sufficient until one takes the universal Grothendieck-categoricalization |8|.





```
class rings_categories
      key || rings_categories_id
      rings_categories_description  
      rings_categories_charactaristics 
      indseminormed? 
      indnormed?
      indBanach? 
      monomorphicindseminormed? 
      monomorphicindnormed?
      monomorphicindBanach? 
      condensed?
      Clausen_Scholze_analytic_1_more_adic_style? 
      Clausen_Scholze_analytic_2_more_categorical_flavor? 
      adic?
      perfectoid?
      topologies_on_the_rings 

class grothendieck_sites_categories
      foreign_key || rings_categories_id # A grothendieck site is realized over one rings category.
      key || grothendieck_sites_categories_id
      grothendieck_sites_description
      grothendieck_topologies 
      underlying_rings_category

class prestacks_as_the_presheaves_categories
      foreign_key || grothendieck_sites_categories_id # A prestack is defined over one grothendieck site.
      key ||  prestacks_as_the_presheaves_categories_id
      prestacks_as_the_presheaves_categories_description
      prestacks_as_the_presheaves_categories_target_categories #groupoid, anima, infinite_groupoid?
      underlying_grothendieck_sites_category

class stacks_as_the_sheaves_categories
      foreign_key || prestacks_as_the_presheaves_id # A stack is the stackification of a prestack.
      key ||  stacks_as_the_sheaves_categories_id
      stacks_as_the_sheaves_categories_description
      stacks_as_the_sheaves_categories_target_categories #groupoid, anima, infinite_groupoid?
      stacks_as_the_sheaves_categories_over_topologies_can_be_realized #v, etale, qproetale
      sheafification_from_the_prestacks_as_the_presheaves_category

      
#1000
class learners_discussions
      key || learners_discussions_id
      learners_discussions_date
      learners_discussions_text
      learners_discussions_references      
      
#1000
class fundamental_questions
      key || fundamental_questions_id
      fundamental_questions_proposing_author
      fundamental_questions_proposing_date
      fundamental_questions_proposing_text     
      fundamental_questions_proposing_references

#1000
class references 
      key || references_id
      references_text

class stylish_applications
      key || stylish_applications_id
      stylish_applications_title
      stylish_applications_related_authors
      stylish_applications_related_text
      stylish_applications_references
         
```


This database is based on analytic stacks in the following (currently) **abstract** sense:    
1A. Clausen-Scholze style (based on their analytic rings in earlier version);  
1B. Clausen-Scholze style (based on their light analytic rings);       
2. Bambozzi-Ben-Bassat-Kremnizer style (based on their large infinite-category of normed rings over F_1);      
3. Scholze style (based on his perfectoid rings, and generalizing from diamonds).



## How to Run the Software

This is a web-application based on Ruby on Rails framework. Therefore as in the usual situation we run the following:

```
rails db:migrate
rails db:seed
rails server
```

Then you will find the page at localhost:3000 starting at the entry page.


## E/R diagram

The corresponding E/R diagram is generated through the ruby gem rails-erd.
```
bundle add rails-erd
bundle exec erd
```

## Normalization

The normalization can be achieved by removing certain implication among the relations. 

## SQL Implementation

We have the following sql implementation for each data model. For instance for rings_categories we have:

```
#ActiveRecord::Base.connection.execute('select * from rings_categories')


sql_create_rings_categories = <<~SQL
    insert into rings_categories  (
      "rings_categories_description",  
      "rings_categories_charactaristics", 
      "indseminormed",
      "indnormed",
      "indBanach",
      "monomorphicindseminormed", 
      "monomorphicindnormed",
      "monomorphicindBanach", 
      "condensed",
      "Clausen_Scholze_analytic_1_more_adic_style", 
      "Clausen_Scholze_analytic_2_more_categorical_flavor", 
      "adic",
      "perfectoid",
      "topologies_on_the_rings",
      "created_at", 
      "updated_at"
    )
    values (
      '#{rings_category_params[:rings_categories_description]}',  
      '#{rings_category_params[:rings_categories_charactaristics]}', 
      '#{rings_category_params[:indseminormed]}', 
      '#{rings_category_params[:indnormed]}',
      '#{rings_category_params[:indBanach]}', 
      '#{rings_category_params[:monomorphicindseminormed]}', 
      '#{rings_category_params[:monomorphicindnormed]}',
      '#{rings_category_params[:monomorphicindBanach]}', 
      '#{rings_category_params[:condensed]}',
      '#{rings_category_params[:Clausen_Scholze_analytic_1_more_adic_style]}', 
      '#{rings_category_params[:Clausen_Scholze_analytic_2_more_categorical_flavor]}', 
      '#{rings_category_params[:adic]}',
      '#{rings_category_params[:perfectoid]}',
      '#{rings_category_params[:topologies_on_the_rings]}',
      CURRENT_TIMESTAMP,
      CURRENT_TIMESTAMP
    )
    SQL
    ActiveRecord::Base.connection.execute(sql_create_rings_categories)


  sql_update_rings_categories = <<~SQL
    update rings_categories  
    set
      "rings_categories_description" = '#{rings_category_params[:rings_categories_description]}',  
      "rings_categories_charactaristics" = '#{rings_category_params[:rings_categories_charactaristics]}', 
      "indseminormed" = '#{rings_category_params[:indseminormed]}', 
      "indnormed" = '#{rings_category_params[:indnormed]}',
      "indBanach" = '#{rings_category_params[:indBanach]}', 
      "monomorphicindseminormed" = '#{rings_category_params[:monomorphicindseminormed]}', 
      "monomorphicindnormed" = '#{rings_category_params[:monomorphicindnormed]}',
      "monomorphicindBanach" = '#{rings_category_params[:monomorphicindBanach]}', 
      "condensed" = '#{rings_category_params[:condensed]}',
      "Clausen_Scholze_analytic_1_more_adic_style" = '#{rings_category_params[:Clausen_Scholze_analytic_1_more_adic_style]}', 
      "Clausen_Scholze_analytic_2_more_categorical_flavor" = '#{rings_category_params[:Clausen_Scholze_analytic_2_more_categorical_flavor]}', 
      "adic" = '#{rings_category_params[:adic]}',
      "perfectoid" = '#{rings_category_params[:perfectoid]}',
      "topologies_on_the_rings" = '#{rings_category_params[:topologies_on_the_rings]}',
      "updated_at" = CURRENT_TIMESTAMP
    where 
    "id" = '#{rings_category_params[:id]}'
    SQL
    ActiveRecord::Base.connection.execute(sql_update_rings_categories)

  sql_delete_rings_categories = <<~SQL
    delete from rings_categories  
    where 
    "id" = '#{@rings_category.id}'
    SQL
    ActiveRecord::Base.connection.execute(sql_delete_rings_categories)   
```
For other models we have the parallel implementation.


## Interface Development

For instance for the corresponding rings_categories we have:
```
class RingsCategoriesController < ApplicationController
  before_action :set_rings_category, only: %i[ show edit update destroy ]

  # GET /rings_categories or /rings_categories.json
  def index
    #ActiveRecord::Base.connection.execute('select * from rings_categories')
    @rings_categories = RingsCategory.all
  end

  # GET /rings_categories/1 or /rings_categories/1.json
  def show
  end

  # GET /rings_categories/new
  def new
    @rings_category = RingsCategory.new
  end

  # GET /rings_categories/1/edit
  def edit
  end

  # POST /rings_categories or /rings_categories.json
  def create


    sql_create_rings_categories = <<~SQL
    insert into rings_categories  (
      "rings_categories_description",  
      "rings_categories_charactaristics", 
      "indseminormed",
      "indnormed",
      "indBanach",
      "monomorphicindseminormed", 
      "monomorphicindnormed",
      "monomorphicindBanach", 
      "condensed",
      "Clausen_Scholze_analytic_1_more_adic_style", 
      "Clausen_Scholze_analytic_2_more_categorical_flavor", 
      "adic",
      "perfectoid",
      "topologies_on_the_rings",
      "created_at", 
      "updated_at"
    )
    values (
      '#{rings_category_params[:rings_categories_description]}',  
      '#{rings_category_params[:rings_categories_charactaristics]}', 
      '#{rings_category_params[:indseminormed]}', 
      '#{rings_category_params[:indnormed]}',
      '#{rings_category_params[:indBanach]}', 
      '#{rings_category_params[:monomorphicindseminormed]}', 
      '#{rings_category_params[:monomorphicindnormed]}',
      '#{rings_category_params[:monomorphicindBanach]}', 
      '#{rings_category_params[:condensed]}',
      '#{rings_category_params[:Clausen_Scholze_analytic_1_more_adic_style]}', 
      '#{rings_category_params[:Clausen_Scholze_analytic_2_more_categorical_flavor]}', 
      '#{rings_category_params[:adic]}',
      '#{rings_category_params[:perfectoid]}',
      '#{rings_category_params[:topologies_on_the_rings]}',
      CURRENT_TIMESTAMP,
      CURRENT_TIMESTAMP
    )
    SQL
    ActiveRecord::Base.connection.execute(sql_create_rings_categories)
    @rings_category = RingsCategory.last



    #@rings_category = RingsCategory.new(rings_category_params)

    respond_to do |format|
      if @rings_category.save
        format.html { redirect_to rings_category_url(@rings_category), notice: "Rings category was successfully created." }
        format.json { render :show, status: :created, location: @rings_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rings_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rings_categories/1 or /rings_categories/1.json
  def update

    sql_update_rings_categories = <<~SQL
    update rings_categories  
    set
      "rings_categories_description" = '#{rings_category_params[:rings_categories_description]}',  
      "rings_categories_charactaristics" = '#{rings_category_params[:rings_categories_charactaristics]}', 
      "indseminormed" = '#{rings_category_params[:indseminormed]}', 
      "indnormed" = '#{rings_category_params[:indnormed]}',
      "indBanach" = '#{rings_category_params[:indBanach]}', 
      "monomorphicindseminormed" = '#{rings_category_params[:monomorphicindseminormed]}', 
      "monomorphicindnormed" = '#{rings_category_params[:monomorphicindnormed]}',
      "monomorphicindBanach" = '#{rings_category_params[:monomorphicindBanach]}', 
      "condensed" = '#{rings_category_params[:condensed]}',
      "Clausen_Scholze_analytic_1_more_adic_style" = '#{rings_category_params[:Clausen_Scholze_analytic_1_more_adic_style]}', 
      "Clausen_Scholze_analytic_2_more_categorical_flavor" = '#{rings_category_params[:Clausen_Scholze_analytic_2_more_categorical_flavor]}', 
      "adic" = '#{rings_category_params[:adic]}',
      "perfectoid" = '#{rings_category_params[:perfectoid]}',
      "topologies_on_the_rings" = '#{rings_category_params[:topologies_on_the_rings]}',
      "updated_at" = CURRENT_TIMESTAMP
    where 
    "id" = '#{rings_category_params[:id]}'
    SQL
    ActiveRecord::Base.connection.execute(sql_update_rings_categories)


    respond_to do |format|
      if @rings_category.update(rings_category_params)
        format.html { redirect_to rings_category_url(@rings_category), notice: "Rings category was successfully updated." }
        format.json { render :show, status: :ok, location: @rings_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rings_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rings_categories/1 or /rings_categories/1.json
  def destroy

    sql_delete_rings_categories = <<~SQL
    delete from rings_categories  
    where 
    "id" = '#{@rings_category.id}'
    SQL
    ActiveRecord::Base.connection.execute(sql_delete_rings_categories)


    #@rings_category.destroy!

    respond_to do |format|
      format.html { redirect_to rings_categories_url, notice: "Rings category was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rings_category
      @rings_category = RingsCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rings_category_params
      params.require(:rings_category).permit(:rings_categories_description, :rings_categories_charactaristics, :indseminormed, :indnormed, :indBanach, :monomorphicindseminormed, :monomorphicindnormed, :monomorphicindBanach, :condensed, :Clausen_Scholze_analytic_1_more_adic_style, :Clausen_Scholze_analytic_2_more_categorical_flavor, :adic, :perfectoid, :topologies_on_the_rings)
    end
end

```

We used the gem devise to implement the corresponding reader log-in and log-out mechanism to authenticate the readers to modify the learning notes.

```
bundle add devise
rails generate devise:install
rails generate devise Reader
rails generate devise:views
```






## Data 

We use the following seeds:
```
for i in 0..2000 do
   Reference.create(references_text: "author#{i}.referencetext#{i}")
end

for i in 0..2000 do
   GrothendieckSitesCategory.create(grothendieck_sites_description: "grothendieck_sites_description#{i}",grothendieck_topologies: "grothendieck_topologies#{i}", underlying_rings_category: "underlying_rings_category#{i}")
end

for i in 0..2000 do
   StacksAsTheSheavesCategory.create(stacks_as_the_sheaves_categories_description: "stacks_as_the_sheaves_categories_description#{i}",
      stacks_as_the_sheaves_categories_target_categories: "stacks_as_the_sheaves_categories_target_categories#{i}", 
      stacks_as_the_sheaves_categories_over_topologies_can_be_realized: "stacks_as_the_sheaves_categories_over_topologies_can_be_realized#{i}", 
      sheafification_from_the_prestacks_as_the_presheaves_category: "sheafification_from_the_prestacks_as_the_presheaves_category#{i}")
end



```







## References:

|1| Deligne, Pierre, and David Mumford. "The irreducibility of the space of curves of given genus." Publications Mathématiques de l'IHÉS 36 (1969): 75-109. <br/>

|2| Giraud, Jean. "Cohomologie non abélienne." Grundlehren der mathematischen Wissenschaften (1971). Vol 179. <br/>

|3| Grothendieck, Alexander. "Technique de descente et théorèmes d'existence en géométrie algébrique. I. Généralités. Descente par morphismes fidèlement plats." Séminaire Bourbaki 5 (1959): 299-327. <br/>

|4| Artin, Michael. "Versal deformations and algebraic stacks." Inventiones mathematicae 27, no. 3 (1974): 165-189. <br/>

|5| Dustin Clausen, and Peter Scholze. "Lectures on Condensed Mathematics." Https://www.math.uni-bonn.de/people/scholze/Condensed.pdf. <br/>

|6| Dustin Clausen, and Peter Scholze. "Lectures on Analytic Geometry." Https://www.math.uni-bonn.de/people/scholze/Analytic.pdf. <br/>

|7| Dustin Clausen, and Peter Scholze. "Analytic Stacks." Https://people.mpim-bonn.mpg.de/scholze/AnalyticStacks.html. <br/>

|8| Bambozzi, Federico, Oren Ben-Bassat, and Kobi Kremnizer. "Analytic geometry over F1 and the Fargues-Fontaine curve." Advances in Mathematics 356 (2019): 106815. <br/>

|9| Scholze, Peter. "Étale cohomology of diamonds." arXiv preprint arXiv:1709.07343 (2017). <br/>

|10| Scholze, Peter. "Perfectoid spaces." Publications mathématiques de l'IHÉS 116, no. 1 (2012): 245-313. <br/>

|11| Xin Tong. "p-adic Motives over Infinite-Analytic Toposes and Infinite-Analytic Stacks." version 2023.  <br/>

|12| Toën, Bertrand, and Gabriele Vezzosi. "Homotopical algebraic geometry I: Topos theory." Advances in mathematics 193, no. 2 (2005): 257-372.<br/>

|13| Toën, Bertrand, and Gabriele Vezzosi. "Homotopical algebraic geometry. II. Geometric stacks and applications." Memoirs of the American Mathematical Society 193, no. 902 (2008). <br/>

|14| Lurie, Jacob. Higher topos theory. Princeton University Press, 2009.<br/>

|15| Jacob Lurie. Spectral Algebraic Geometry. Https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf.<br/>

|16| Kedlaya, K. S., and R. Liu. "Relative p-adic hodge theory: Foundations." Astérisque 2015, no. 371 (2015): 1-245.<br/>

|17| Kedlaya, Kiran S., and Ruochuan Liu. "Relative p-adic Hodge theory, II: Imperfect period rings." arXiv preprint arXiv:1602.06899 (2016). <br/>

|18| Huber, Roland. "A generalization of formal schemes and rigid analytic varieties." Mathematische Zeitschrift 217 (1994): 513-551.<br/>

|19| Huber, Roland. "Continuous valuations." Math. Z 212, no. 3 (1993): 455-477. <br/>




