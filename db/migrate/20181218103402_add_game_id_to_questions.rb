class AddGameIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :game_id, :integer
  end
end
