require 'test_helper'

class InterviewerTest < ActiveSupport::TestCase
  test "interviewer can have a schedule" do
    i = interviewers(:hr)
    assert i.interview_schedule != nil
  end
end
