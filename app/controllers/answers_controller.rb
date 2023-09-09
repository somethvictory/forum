class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(user: current_user, body: answer_params[:body])

    if @answer.save
      redirect_to question_path(@question, answer_id: @answer.id)
    else
      render 'questions/show'
    end
  end

  def edit
    @question = current_user.questions.find(params[:id])

    render :new
  end

  def update
    @question = current_user.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to root_path, question_id: @question.id
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
