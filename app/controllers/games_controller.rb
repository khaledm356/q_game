class GamesController < ApplicationController
  before_action :set_question , only: [:check_answer]
  def check_answer
    @game = Game.first
    @questions = @game.questions.where(solved: false)
    @ids = []
    @questions.each do |e|
      @ids << e.id
    end
    @ids.delete(@question.id)
    @question.solved = true
    @question.save!
    if params[:question][:answer] == @question.answer.to_s && @question.child.present? && @question.child_no < 6
      redirect_to "/games/answer/#{@question.child.id}"
    elsif @ids.count > 0
      redirect_to "/games/answer/#{@ids.sample}"
    else
      redirect_to root_path, :flash => { :notice => "You have finished the quesiton of this game" }
    end
  end

  def answer
    @question = Game.first.questions.find(params[:id])
    # @question = Question.find(params[:id])
  end


  private

  def question_params
    params.require(:question).permit(:answer)
  end

  def set_question
    @question = Game.first.questions.find(params[:id])
  end

end
