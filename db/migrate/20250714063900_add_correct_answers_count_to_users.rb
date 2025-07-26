class AddCorrectAnswersCountToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :correct_answers_count, :integer, default: 0, null: false
  end
end
