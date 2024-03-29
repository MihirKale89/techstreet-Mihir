require 'test_helper'
require 'pp'

class InterviewTest < ActiveSupport::TestCase

  def setup
    create_answers_and_ratings
  end

  test "interviews have multiple questions" do
    i = interviews(:first_driver_interview)
    assert i.interview_questions.any?
  end

  test "interview questions should have answers" do
    i = interviews(:first_driver_interview)
    assert i.questions.first.answers.any?
  end

  test "interview questions should be in order" do
    i = interviews(:first_driver_interview)
    # I stopped shuffling the questions to randomize question order.
    # This made the test case pass
    assert_equal i.interview_questions.first.display_order, 1
  end

end
