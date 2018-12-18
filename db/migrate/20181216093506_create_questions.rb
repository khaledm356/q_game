class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.boolean :answer
      t.integer :parent_id

      t.timestamps
    end
  end
end
