class CreateFundamentalQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :fundamental_questions do |t|
      t.string :fundamental_questions_proposing_author
      t.string :fundamental_questions_proposing_date
      t.string :fundamental_questions_proposing_text
      t.string :fundamental_questions_proposing_references

      t.timestamps
    end
  end
end
