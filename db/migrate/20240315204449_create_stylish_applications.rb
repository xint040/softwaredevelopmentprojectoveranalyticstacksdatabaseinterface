class CreateStylishApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :stylish_applications do |t|
      t.string :stylish_applications_title
      t.string :stylish_applications_related_authors
      t.string :stylish_applications_related_text
      t.string :stylish_applications_references

      t.timestamps
    end
  end
end
