class StylishApplicationsController < ApplicationController
  before_action :set_stylish_application, only: %i[ show edit update destroy ]

  # GET /stylish_applications or /stylish_applications.json
  def index
    #ActiveRecord::Base.connection.execute('select * from stylish_applications')
    @stylish_applications = StylishApplication.all
  end

  # GET /stylish_applications/1 or /stylish_applications/1.json
  def show
  end

  # GET /stylish_applications/new
  def new
    @stylish_application = StylishApplication.new
  end

  # GET /stylish_applications/1/edit
  def edit
  end

  # POST /stylish_applications or /stylish_applications.json
  def create
    sql_create_stylish_applications = <<~SQL
    insert into stylish_applications  (
      "stylish_applications_title",
      "stylish_applications_related_authors",
      "stylish_applications_related_text",
      "stylish_applications_references",
      "created_at", 
      "updated_at"
    )
    values (
      '#{stylish_application_params[:stylish_applications_title]}',
      '#{stylish_application_params[:stylish_applications_related_authors]}',
      '#{stylish_application_params[:stylish_applications_related_text]}',
      '#{stylish_application_params[:stylish_applications_references]}',
      CURRENT_TIMESTAMP,
      CURRENT_TIMESTAMP
    )
    SQL
    ActiveRecord::Base.connection.execute(sql_create_stylish_applications)
    @stylish_application = StylishApplication.last



    #@stylish_application = StylishApplication.new(stylish_application_params)

    respond_to do |format|
      if @stylish_application.save
        format.html { redirect_to stylish_application_url(@stylish_application), notice: "Stylish application was successfully created." }
        format.json { render :show, status: :created, location: @stylish_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stylish_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stylish_applications/1 or /stylish_applications/1.json
  def update

    sql_update_stylish_applications = <<~SQL
    update stylish_applications  
    set
      "stylish_applications_title"='#{stylish_application_params[:stylish_applications_title]}',
      "stylish_applications_related_authors"='#{stylish_application_params[:stylish_applications_related_authors]}',
      "stylish_applications_related_text"='#{stylish_application_params[:stylish_applications_related_text]}',
      "stylish_applications_references"='#{stylish_application_params[:stylish_applications_references]}',
      "updated_at" = CURRENT_TIMESTAMP
    where
    "id"='#{stylish_application_params[:id]}'
    SQL
    ActiveRecord::Base.connection.execute(sql_update_stylish_applications)

    respond_to do |format|
      if @stylish_application.update(stylish_application_params)
        format.html { redirect_to stylish_application_url(@stylish_application), notice: "Stylish application was successfully updated." }
        format.json { render :show, status: :ok, location: @stylish_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stylish_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stylish_applications/1 or /stylish_applications/1.json
  def destroy

    sql_delete_stylish_applications = <<~SQL
    delete from stylish_applications  
    where
    "id"='#{@stylish_application.id}'
    SQL
    ActiveRecord::Base.connection.execute(sql_delete_stylish_applications)

    #@stylish_application.destroy!

    respond_to do |format|
      format.html { redirect_to stylish_applications_url, notice: "Stylish application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stylish_application
      @stylish_application = StylishApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stylish_application_params
      params.require(:stylish_application).permit(:stylish_applications_title, :stylish_applications_related_authors, :stylish_applications_related_text, :stylish_applications_references)
    end
end
