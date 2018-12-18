class AddChildNoToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :child_no, :integer, :default => 0
  end
end
