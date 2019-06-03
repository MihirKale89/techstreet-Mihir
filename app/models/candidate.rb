class Candidate < ApplicationRecord
  has_many :interviews
  has_many :positions, through: :interviews
  has_many :questions, through: :interviews
  has_many :answers

  # I am assuming that we have to find average rating for a specific interview
  def find_average_rating(interview)
    return 0 unless self.interviews.include?(interview)
    interview_answers = self.answers.where(interview: interview)
    rating_sum = rating_count = 0
    interview_answers.each do |ans|
      ans.answer_ratings.each do |ans_rating|
        unless ans_rating.rating == 0
          rating_sum += ans_rating.rating
          rating_count += 1
        end
      end
    end
    p rating_sum/rating_count
    rating_sum/rating_count
  end

end
