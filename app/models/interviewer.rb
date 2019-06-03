class Interviewer < ApplicationRecord
  has_many :answer_ratings
  has_many :interviews
  has_many :interview_participants
  has_many :interviews, through: :interview_participants

  def interview_schedule
    schedule = Hash.new
    next2Interviews = self.interviews.order(:interview_date).limit(2)
    next2Candidates = Array.new
    next2InterviewQuestions = Array.new
    next2Interviews.each do |i|
      next2Candidates << i.candidate
      next2InterviewQuestions << i.questions
    end
    schedule['interviews'] = next2Interviews
    schedule['candidates'] = next2Candidates
    schedule['questions'] = next2InterviewQuestions
    p schedule
    return schedule
  end

end
