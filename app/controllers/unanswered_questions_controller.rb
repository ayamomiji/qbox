class UnansweredQuestionsController < ApplicationController
  def index
    @user = current_user
    @questions = @user.questions.sorted
  end
end
