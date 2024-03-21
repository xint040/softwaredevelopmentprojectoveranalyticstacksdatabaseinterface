class StacksAsTheSheavesCategoriesController < ApplicationController
  require 'csv'
  before_action :set_stacks_as_the_sheaves_category, only: %i[ show edit update destroy ]

  # GET /stacks_as_the_sheaves_categories or /stacks_as_the_sheaves_categories.json
  def index
    #ActiveRecord::Base.connection.execute('select * from stacks_as_the_sheaves_categories')
    @stacks_as_the_sheaves_categories = StacksAsTheSheavesCategory.all
  end

  # GET /stacks_as_the_sheaves_categories/1 or /stacks_as_the_sheaves_categories/1.json
  def show
  end

  # GET /stacks_as_the_sheaves_categories/new
  def new
    @stacks_as_the_sheaves_category = StacksAsTheSheavesCategory.new
  end

  # GET /stacks_as_the_sheaves_categories/1/edit
  def edit
  end

  # POST /stacks_as_the_sheaves_categories or /stacks_as_the_sheaves_categories.json
  def create

    sql_create_stacks_as_the_sheaves_categories = <<~SQL
    insert into stacks_as_the_sheaves_categories  (
      "stacks_as_the_sheaves_categories_description",
      "stacks_as_the_sheaves_categories_target_categories", 
      "stacks_as_the_sheaves_categories_over_topologies_can_be_realized", 
      "sheafification_from_the_prestacks_as_the_presheaves_category",
      "created_at", 
      "updated_at"
    )
    values (
      '#{stacks_as_the_sheaves_category_params[:stacks_as_the_sheaves_categories_description]}',
      '#{stacks_as_the_sheaves_category_params[:stacks_as_the_sheaves_categories_target_categories]}', 
      '#{stacks_as_the_sheaves_category_params[:stacks_as_the_sheaves_categories_over_topologies_can_be_realized]}',
      '#{stacks_as_the_sheaves_category_params[:sheafification_from_the_prestacks_as_the_presheaves_category]}',
      CURRENT_TIMESTAMP,
      CURRENT_TIMESTAMP
    )
    SQL
    ActiveRecord::Base.connection.execute(sql_create_stacks_as_the_sheaves_categories)
    @stacks_as_the_sheaves_category = StacksAsTheSheavesCategory.last


    #@stacks_as_the_sheaves_category = StacksAsTheSheavesCategory.new(stacks_as_the_sheaves_category_params)

    respond_to do |format|
      if @stacks_as_the_sheaves_category.save
        format.html { redirect_to stacks_as_the_sheaves_category_url(@stacks_as_the_sheaves_category), notice: "Stacks as the sheaves category was successfully created." }
        format.json { render :show, status: :created, location: @stacks_as_the_sheaves_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stacks_as_the_sheaves_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stacks_as_the_sheaves_categories/1 or /stacks_as_the_sheaves_categories/1.json
  def update

    sql_update_stacks_as_the_sheaves_categories = <<~SQL
    update stacks_as_the_sheaves_categories  
    set
      "stacks_as_the_sheaves_categories_description"='#{stacks_as_the_sheaves_category_params[:stacks_as_the_sheaves_categories_description]}',
      "stacks_as_the_sheaves_categories_target_categories"='#{stacks_as_the_sheaves_category_params[:stacks_as_the_sheaves_categories_target_categories]}', 
      "stacks_as_the_sheaves_categories_over_topologies_can_be_realized"='#{stacks_as_the_sheaves_category_params[:stacks_as_the_sheaves_categories_over_topologies_can_be_realized]}',
      "sheafification_from_the_prestacks_as_the_presheaves_category"='#{stacks_as_the_sheaves_category_params[:sheafification_from_the_prestacks_as_the_presheaves_category]}',
      "updated_at" = CURRENT_TIMESTAMP
    where
    "id"= '#{stacks_as_the_sheaves_category_params[:id]}'
    SQL
    ActiveRecord::Base.connection.execute(sql_update_stacks_as_the_sheaves_categories)

    respond_to do |format|
      if @stacks_as_the_sheaves_category.update(stacks_as_the_sheaves_category_params)
        format.html { redirect_to stacks_as_the_sheaves_category_url(@stacks_as_the_sheaves_category), notice: "Stacks as the sheaves category was successfully updated." }
        format.json { render :show, status: :ok, location: @stacks_as_the_sheaves_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stacks_as_the_sheaves_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stacks_as_the_sheaves_categories/1 or /stacks_as_the_sheaves_categories/1.json
  def destroy

    sql_delete_stacks_as_the_sheaves_categories = <<~SQL
    delete from stacks_as_the_sheaves_categories  
    where
    "id"= '#{@stacks_as_the_sheaves_category.id}'
    SQL
    ActiveRecord::Base.connection.execute(sql_delete_stacks_as_the_sheaves_categories)


    #@stacks_as_the_sheaves_category.destroy!

    respond_to do |format|
      format.html { redirect_to stacks_as_the_sheaves_categories_url, notice: "Stacks as the sheaves category was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stacks_as_the_sheaves_category
      @stacks_as_the_sheaves_category = StacksAsTheSheavesCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stacks_as_the_sheaves_category_params
      params.require(:stacks_as_the_sheaves_category).permit(:stacks_as_the_sheaves_categories_description, :stacks_as_the_sheaves_categories_target_categories, :stacks_as_the_sheaves_categories_over_topologies_can_be_realized, :sheafification_from_the_prestacks_as_the_presheaves_category)
    end
end
