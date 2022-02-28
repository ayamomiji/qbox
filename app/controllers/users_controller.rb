class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @question = @user.questions.new
    @answers = @user.answers.recently
  end
end
