# frozen_string_literal: true

class QuestionsController < ApplicationController
  def create
    @user = User.friendly.find(params[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      render :create
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @question = @user.questions.find(params[:id])
    @question.archive!
    render turbo_stream: turbo_stream.remove(@question)
  end

  private

  def question_params
    params.require(:question).permit(:body, :response)
  end
end
