class CreateLearnersNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :learners_notes do |t|
      t.belongs_to :reader
      t.string :learners_notes_title
      t.string :learners_notes_date
      t.string :learners_notes_description
      t.string :learners_notes_text
      t.string :learners_notes_more_things_want_to_learn_on_analytic_stacks

      t.timestamps
    end
  end
end
