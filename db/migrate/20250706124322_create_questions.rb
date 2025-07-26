class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.references :quiz_set, null: false, foreign_key: true
      t.string :content
      t.integer :correct_choice_id

      t.timestamps
    end
  end
end
