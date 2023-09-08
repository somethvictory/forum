class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to root_path, question_id: @question.id
    else
      render :new
    end
  end

  def show
    @question = current_user.questions.find(params[:id])
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end
end
