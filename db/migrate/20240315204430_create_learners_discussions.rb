class CreateLearnersDiscussions < ActiveRecord::Migration[7.1]
  def change
    create_table :learners_discussions do |t|
      t.string :learners_discussions_date
      t.string :learners_discussions_text
      t.string :learners_discussions_references

      t.timestamps
    end
  end
end
