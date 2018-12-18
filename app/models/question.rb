class Question < ApplicationRecord
  belongs_to :parent, class_name: 'Question', optional: true
  belongs_to :game, optional: true, :foreign_key => :game_id
  has_one :child, :class_name => 'Question', :foreign_key => :parent_id
  # validates_uniqueness_of :parent_id
  # items without parent are the top-level menu items
  after_save :child_degree, unless: ->{self.parent_id == nil}
  scope :main_questions, -> { where(parent_id: nil) }

  def child_degree
      self.child_no = self.parent.child_no + 1
  end
end
