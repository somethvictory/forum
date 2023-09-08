class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.create!(question_params)

    redirect_to root_path, question_id: @question.id
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end
end
