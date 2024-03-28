class FundamentalQuestionsController < ApplicationController
  before_action :set_fundamental_question, only: %i[ show edit update destroy ]

  # GET /fundamental_questions or /fundamental_questions.json
  def index
    sql_sorting_fundamental_questions = <<~SQL
      select * 
      from fundamental_questions
      order by "fundamental_questions_proposing_author"
    SQL

    if params[:sortingqueryindicator] 
      @fundamental_questions = ActiveRecord::Base.connection.execute(sql_sorting_fundamental_questions)
    else 
      @fundamental_questions = ActiveRecord::Base.connection.execute('select * from fundamental_questions')    
    end





    


    





  end

  # GET /fundamental_questions/1 or /fundamental_questions/1.json
  def show
  end

  # GET /fundamental_questions/new
  def new
    @fundamental_question = FundamentalQuestion.new
  end

  # GET /fundamental_questions/1/edit
  def edit
  end

  # POST /fundamental_questions or /fundamental_questions.json
  def create

    sql_create_fundamental_questions = <<~SQL
    insert into fundamental_questions (
      "fundamental_questions_proposing_author",
      "fundamental_questions_proposing_date",
      "fundamental_questions_proposing_text",     
      "fundamental_questions_proposing_references",
      "created_at", 
      "updated_at"
    )
    values (
      '#{fundamental_question_params[:fundamental_questions_proposing_author]}',
      '#{fundamental_question_params[:fundamental_questions_proposing_date]}',
      '#{fundamental_question_params[:fundamental_questions_proposing_text]}',     
      '#{fundamental_question_params[:fundamental_questions_proposing_references]}',
      CURRENT_TIMESTAMP,
      CURRENT_TIMESTAMP
    )
    SQL
    ActiveRecord::Base.connection.execute(sql_create_fundamental_questions)
    @fundamental_question = FundamentalQuestion.last

 #   @fundamental_question = FundamentalQuestion.new(fundamental_question_params)

    respond_to do |format|
      if @fundamental_question.save
        format.html { redirect_to fundamental_question_url(@fundamental_question), notice: "Fundamental question was successfully created." }
        format.json { render :show, status: :created, location: @fundamental_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fundamental_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fundamental_questions/1 or /fundamental_questions/1.json



  def update
    sql_update_fundamental_questions = <<~SQL
    update fundamental_questions 
    set 
    "fundamental_questions_proposing_author" = '#{fundamental_question_params[:fundamental_questions_proposing_author]}',
    "fundamental_questions_proposing_date" = '#{fundamental_question_params[:fundamental_questions_proposing_date]}',
    "fundamental_questions_proposing_text" = '#{fundamental_question_params[:fundamental_questions_proposing_text]}',     
    "fundamental_questions_proposing_references" = '#{fundamental_question_params[:fundamental_questions_proposing_references]}', 
    "updated_at" = CURRENT_TIMESTAMP
    where
    "id"= '#{fundamental_question_params[:id]}'
    SQL
    ActiveRecord::Base.connection.execute(sql_update_fundamental_questions)

    respond_to do |format|
      if @fundamental_question.update(fundamental_question_params)
        format.html { redirect_to fundamental_question_url(@fundamental_question), notice: "Fundamental question was successfully updated." }
        format.json { render :show, status: :ok, location: @fundamental_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fundamental_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fundamental_questions/1 or /fundamental_questions/1.json
  def destroy

    sql_delete_fundamental_questions = <<~SQL
    delete 
    from fundamental_questions
    where  "id"= '#{@fundamental_question.id}'
    SQL
    ActiveRecord::Base.connection.execute(sql_delete_fundamental_questions)

   # @fundamental_question.destroy!

    respond_to do |format|
      format.html { redirect_to fundamental_questions_url, notice: "Fundamental question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  


  
 
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fundamental_question
      @fundamental_question = FundamentalQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fundamental_question_params
      params.require(:fundamental_question).permit(:fundamental_questions_proposing_author, :fundamental_questions_proposing_date, :fundamental_questions_proposing_text, :fundamental_questions_proposing_references)
    end
end
