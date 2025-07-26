class CreateQuizSets < ActiveRecord::Migration[8.0]
  def change
    create_table :quiz_sets do |t|
      t.string :title

      t.timestamps
    end
  end
end
