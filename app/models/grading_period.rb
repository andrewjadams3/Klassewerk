class GradingPeriod < ActiveRecord::Base
  validates :start_date, :end_date, presence: true
  validate :validate_grading_period
  def validate_grading_period
    if start_date && end_date != nil
      if start_date >= end_date
        errors.add(:end_date, "must be later than the start_date")
      end
    end
  end
end
