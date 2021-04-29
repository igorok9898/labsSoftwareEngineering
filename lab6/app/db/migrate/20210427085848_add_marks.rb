class AddMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.integer :points
      t.string :letter
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
