class CreateReferences < ActiveRecord::Migration[7.1]
  def change
    create_table :references do |t|
      t.string :references_text

      t.timestamps
    end
  end
end
