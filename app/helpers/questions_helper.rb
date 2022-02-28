# frozen_string_literal: true

module QuestionsHelper
  def text_to_line_breaks(text)
    text.split("\n").map { h _1 }.join("<br />").html_safe
  end
end
