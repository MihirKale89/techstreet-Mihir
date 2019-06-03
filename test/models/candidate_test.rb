require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  def setup
    create_answers_and_ratings
  end

  test "average rating should not be nil" do
    c = Candidate.first
    i = c.interviews.first
    assert c.find_average_rating(i) != nil
  end
end
