class LearnersDiscussionsController < ApplicationController
  before_action :set_learners_discussion, only: %i[ show edit update destroy ]

  # GET /learners_discussions or /learners_discussions.json
  def index
    #ActiveRecord::Base.connection.execute('select * from learners_discussions')
    @learners_discussions = LearnersDiscussion.all
  end

  # GET /learners_discussions/1 or /learners_discussions/1.json
  def show
  end

  # GET /learners_discussions/new
  def new
    @learners_discussion = LearnersDiscussion.new
  end

  # GET /learners_discussions/1/edit
  def edit
  end

  # POST /learners_discussions or /learners_discussions.json
  def create

    sql_create_learners_discussions = <<~SQL
    insert into learners_discussions  (
      "learners_discussions_date",
      "learners_discussions_text",
      "learners_discussions_references", 
      "created_at", 
      "updated_at"
    )
    values (
      '#{learners_discussion_params[:learners_discussions_date]}',
      '#{learners_discussion_params[:learners_discussions_text]}',
      '#{learners_discussion_params[:learners_discussions_references]}',
      CURRENT_TIMESTAMP,
      CURRENT_TIMESTAMP
    )
    SQL
    ActiveRecord::Base.connection.execute(sql_create_learners_discussions)
    @learners_discussion = LearnersDiscussion.last

    #@learners_discussion = LearnersDiscussion.new(learners_discussion_params)

    respond_to do |format|
      if @learners_discussion.save
        format.html { redirect_to learners_discussion_url(@learners_discussion), notice: "Learners discussion was successfully created." }
        format.json { render :show, status: :created, location: @learners_discussion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @learners_discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learners_discussions/1 or /learners_discussions/1.json
  def update

    sql_update_learners_discussions = <<~SQL
    update learners_discussions  
    set
      "learners_discussions_date" = '#{learners_discussion_params[:learners_discussions_date]}',
      "learners_discussions_text" = '#{learners_discussion_params[:learners_discussions_text]}',
      "learners_discussions_references" = '#{learners_discussion_params[:learners_discussions_references]}',
      "updated_at" = CURRENT_TIMESTAMP
    where
    "id" = '#{learners_discussion_params[:id]}'
    SQL
    ActiveRecord::Base.connection.execute(sql_update_learners_discussions)


    respond_to do |format|
      if @learners_discussion.update(learners_discussion_params)
        format.html { redirect_to learners_discussion_url(@learners_discussion), notice: "Learners discussion was successfully updated." }
        format.json { render :show, status: :ok, location: @learners_discussion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @learners_discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learners_discussions/1 or /learners_discussions/1.json
  def destroy

    sql_delete_learners_discussions = <<~SQL
    delete from learners_discussions  
    where
    "id" = '#{@learners_discussion.id}'
    SQL
    ActiveRecord::Base.connection.execute(sql_delete_learners_discussions)


   # @learners_discussion.destroy!

    respond_to do |format|
      format.html { redirect_to learners_discussions_url, notice: "Learners discussion was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learners_discussion
      @learners_discussion = LearnersDiscussion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def learners_discussion_params
      params.require(:learners_discussion).permit(:learners_discussions_date, :learners_discussions_text, :learners_discussions_references)
    end
end
