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

  private

  def question_params
    params.require(:question).permit(:body, :response)
  end
end
