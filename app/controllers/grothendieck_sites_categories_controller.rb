class GrothendieckSitesCategoriesController < ApplicationController
  before_action :set_grothendieck_sites_category, only: %i[ show edit update destroy ]

  # GET /grothendieck_sites_categories or /grothendieck_sites_categories.json
  def index
    #ActiveRecord::Base.connection.execute('select * from grothendieck_sites_categories')
    @grothendieck_sites_categories = GrothendieckSitesCategory.all
  end

  # GET /grothendieck_sites_categories/1 or /grothendieck_sites_categories/1.json
  def show
  end

  # GET /grothendieck_sites_categories/new
  def new
    @grothendieck_sites_category = GrothendieckSitesCategory.new
  end

  # GET /grothendieck_sites_categories/1/edit
  def edit
  end

  # POST /grothendieck_sites_categories or /grothendieck_sites_categories.json
  def create

    sql_create_grothendieck_sites_categories = <<~SQL
    insert into grothendieck_sites_categories (
      "grothendieck_sites_description",
      "grothendieck_topologies", 
      "underlying_rings_category",
      "created_at", 
      "updated_at"
    )
    values (
      '#{grothendieck_sites_category_params[:grothendieck_sites_description]}',
      '#{grothendieck_sites_category_params[:grothendieck_topologies]}', 
      '#{grothendieck_sites_category_params[:underlying_rings_category]}',
      CURRENT_TIMESTAMP,
      CURRENT_TIMESTAMP
    )
    SQL
    ActiveRecord::Base.connection.execute(sql_create_grothendieck_sites_categories)
    @grothendieck_sites_category = GrothendieckSitesCategory.last



    #@grothendieck_sites_category = GrothendieckSitesCategory.new(grothendieck_sites_category_params)

    respond_to do |format|
      if @grothendieck_sites_category.save
        format.html { redirect_to grothendieck_sites_category_url(@grothendieck_sites_category), notice: "Grothendieck sites category was successfully created." }
        format.json { render :show, status: :created, location: @grothendieck_sites_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grothendieck_sites_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grothendieck_sites_categories/1 or /grothendieck_sites_categories/1.json
  def update

    sql_update_grothendieck_sites_categories = <<~SQL
    update grothendieck_sites_categories
    set
      "grothendieck_sites_description" = '#{grothendieck_sites_category_params[:grothendieck_sites_description]}',
      "grothendieck_topologies" = '#{grothendieck_sites_category_params[:grothendieck_topologies]}', 
      "underlying_rings_category" = '#{grothendieck_sites_category_params[:underlying_rings_category]}',
      "updated_at" = CURRENT_TIMESTAMP,
    where
    "id" = '#{grothendieck_sites_category_params[:id]}'
    SQL
    ActiveRecord::Base.connection.execute(sql_update_grothendieck_sites_categories)

    respond_to do |format|
      if @grothendieck_sites_category.update(grothendieck_sites_category_params)
        format.html { redirect_to grothendieck_sites_category_url(@grothendieck_sites_category), notice: "Grothendieck sites category was successfully updated." }
        format.json { render :show, status: :ok, location: @grothendieck_sites_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grothendieck_sites_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grothendieck_sites_categories/1 or /grothendieck_sites_categories/1.json
  def destroy

    sql_delete_grothendieck_sites_categories = <<~SQL
    delete 
    from grothendieck_sites_categories 
    where "id" = '#{@grothendieck_sites_category.id}'
    SQL
    ActiveRecord::Base.connection.execute(sql_delete_grothendieck_sites_categories)


  #  @grothendieck_sites_category.destroy!

    respond_to do |format|
      format.html { redirect_to grothendieck_sites_categories_url, notice: "Grothendieck sites category was successfully destroyed." }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grothendieck_sites_category
      @grothendieck_sites_category = GrothendieckSitesCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grothendieck_sites_category_params
      params.require(:grothendieck_sites_category).permit(:grothendieck_sites_description, :grothendieck_topologies, :underlying_rings_category)
    end
end
