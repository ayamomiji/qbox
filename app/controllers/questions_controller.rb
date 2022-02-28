class QuestionsController < ApplicationController
  def create
    @user = User.friendly.find(params[:user_id])
    @question = @user.questions.new(question_params)
    @question.save
    redirect_to user_path(@user)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end
end
