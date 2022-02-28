class AnswersController < ApplicationController
  before_action :find_user
  before_action :find_question

  def create
    @answer = @question.answer || @question.build_answer
    @answer.update(answer_params)
    redirect_to :back
  end

  private

  def find_user
    @user = current_user
  end

  def find_question
    @question = @user.questions.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
