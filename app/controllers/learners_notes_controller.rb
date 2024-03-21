class LearnersNotesController < ApplicationController
  before_action :set_learners_note, only: %i[ show edit update destroy ]
  before_action :authenticate_reader!

  # GET /learners_notes or /learners_notes.json
  def index
    @learners_notes = current_reader.learners_notes.all
  end

  # GET /learners_notes/1 or /learners_notes/1.json
  def show
  end

  # GET /learners_notes/new
  def new
    @learners_note = current_reader.learners_notes.new
  end

  # GET /learners_notes/1/edit
  def edit
  end

  # POST /learners_notes or /learners_notes.json
  def create
    @learners_note = current_reader.learners_notes.new(learners_note_params)

    respond_to do |format|
      if @learners_note.save
        format.html { redirect_to learners_note_url(@learners_note), notice: "Learners note was successfully created." }
        format.json { render :show, status: :created, location: @learners_note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @learners_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learners_notes/1 or /learners_notes/1.json
  def update
    respond_to do |format|
      if @learners_note.update(learners_note_params)
        format.html { redirect_to learners_note_url(@learners_note), notice: "Learners note was successfully updated." }
        format.json { render :show, status: :ok, location: @learners_note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @learners_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learners_notes/1 or /learners_notes/1.json
  def destroy
    @learners_note.destroy!

    respond_to do |format|
      format.html { redirect_to learners_notes_url, notice: "Learners note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learners_note
      @learners_note = current_reader.learners_notes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def learners_note_params
      params.require(:learners_note).permit(:learners_notes_title, :learners_notes_date, :learners_notes_description, :learners_notes_text, :learners_notes_more_things_want_to_learn_on_analytic_stacks)
    end
end
