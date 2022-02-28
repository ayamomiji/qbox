# frozen_string_literal: true

class UnansweredQuestionsController < ApplicationController
  def index
    @user = current_user
    @questions = @user.questions.unarchived.unanswered.sorted
  end
end
