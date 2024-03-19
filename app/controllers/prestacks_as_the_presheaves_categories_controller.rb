class PrestacksAsThePresheavesCategoriesController < ApplicationController
  before_action :set_prestacks_as_the_presheaves_category, only: %i[ show edit update destroy ]

  # GET /prestacks_as_the_presheaves_categories or /prestacks_as_the_presheaves_categories.json
  def index
    #ActiveRecord::Base.connection.execute('select * from prestacks_as_the_presheaves_categories')
    @prestacks_as_the_presheaves_categories = PrestacksAsThePresheavesCategory.all
  end

  # GET /prestacks_as_the_presheaves_categories/1 or /prestacks_as_the_presheaves_categories/1.json
  def show
  end

  # GET /prestacks_as_the_presheaves_categories/new
  def new
    @prestacks_as_the_presheaves_category = PrestacksAsThePresheavesCategory.new
  end

  # GET /prestacks_as_the_presheaves_categories/1/edit
  def edit
  end

  # POST /prestacks_as_the_presheaves_categories or /prestacks_as_the_presheaves_categories.json
  def create

    sql_create_prestacks_as_the_presheaves_categories = <<~SQL
    insert into prestacks_as_the_presheaves_categories  (
      "prestacks_as_the_presheaves_categories_description",
      "prestacks_as_the_presheaves_categories_target_categories",
      "underlying_grothendieck_sites_category",
      "created_at", 
      "updated_at"
    )
    values (
      '#{prestacks_as_the_presheaves_category_params[:prestacks_as_the_presheaves_categories_description]}',
      '#{prestacks_as_the_presheaves_category_params[:prestacks_as_the_presheaves_categories_target_categories]}', 
      '#{prestacks_as_the_presheaves_category_params[:underlying_grothendieck_sites_category]}',
      CURRENT_TIMESTAMP,
      CURRENT_TIMESTAMP
    )
    SQL
    ActiveRecord::Base.connection.execute(sql_create_prestacks_as_the_presheaves_categories)
    @prestacks_as_the_presheaves_category = PrestacksAsThePresheavesCategory.last

    #@prestacks_as_the_presheaves_category = PrestacksAsThePresheavesCategory.new(prestacks_as_the_presheaves_category_params)

    respond_to do |format|
      if @prestacks_as_the_presheaves_category.save
        format.html { redirect_to prestacks_as_the_presheaves_category_url(@prestacks_as_the_presheaves_category), notice: "Prestacks as the presheaves category was successfully created." }
        format.json { render :show, status: :created, location: @prestacks_as_the_presheaves_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prestacks_as_the_presheaves_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prestacks_as_the_presheaves_categories/1 or /prestacks_as_the_presheaves_categories/1.json
  def update

    sql_update_prestacks_as_the_presheaves_categories = <<~SQL
    update prestacks_as_the_presheaves_categories  
    set 
      "prestacks_as_the_presheaves_categories_description" = '#{prestacks_as_the_presheaves_category_params[:prestacks_as_the_presheaves_categories_description]}',
      "prestacks_as_the_presheaves_categories_target_categories" = '#{prestacks_as_the_presheaves_category_params[:prestacks_as_the_presheaves_categories_target_categories]}', 
      "underlying_grothendieck_sites_category" = '#{prestacks_as_the_presheaves_category_params[:underlying_grothendieck_sites_category]}',
      "updated_at" = CURRENT_TIMESTAMP
    where
    "id" = '#{prestacks_as_the_presheaves_category_params[:id]}'
    SQL
    ActiveRecord::Base.connection.execute(sql_update_prestacks_as_the_presheaves_categories)


    respond_to do |format|
      if @prestacks_as_the_presheaves_category.update(prestacks_as_the_presheaves_category_params)
        format.html { redirect_to prestacks_as_the_presheaves_category_url(@prestacks_as_the_presheaves_category), notice: "Prestacks as the presheaves category was successfully updated." }
        format.json { render :show, status: :ok, location: @prestacks_as_the_presheaves_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prestacks_as_the_presheaves_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestacks_as_the_presheaves_categories/1 or /prestacks_as_the_presheaves_categories/1.json
  def destroy


    sql_delete_prestacks_as_the_presheaves_categories = <<~SQL
    delete from prestacks_as_the_presheaves_categories  
    where
    "id" = '#{@prestacks_as_the_presheaves_category.id}'
    SQL
    ActiveRecord::Base.connection.execute(sql_delete_prestacks_as_the_presheaves_categories)


    #@prestacks_as_the_presheaves_category.destroy!

    respond_to do |format|
      format.html { redirect_to prestacks_as_the_presheaves_categories_url, notice: "Prestacks as the presheaves category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestacks_as_the_presheaves_category
      @prestacks_as_the_presheaves_category = PrestacksAsThePresheavesCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prestacks_as_the_presheaves_category_params
      params.require(:prestacks_as_the_presheaves_category).permit(:prestacks_as_the_presheaves_categories_description, :prestacks_as_the_presheaves_categories_target_categories, :underlying_grothendieck_sites_category)
    end
end
