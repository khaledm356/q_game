class StaticPagesController < ApplicationController
  def home
    @question = Game.first.questions.where(solved: false).first
  end
end
