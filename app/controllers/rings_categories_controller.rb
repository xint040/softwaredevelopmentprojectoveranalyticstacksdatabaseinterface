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
