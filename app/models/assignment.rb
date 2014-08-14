class Assignment < ActiveRecord::Base
  validates :due_date, :assigned_date, :worksheet, presence: true
  belongs_to :classroom
  belongs_to :worksheet

  validate :validate_assigned_period, :due_in_future, :assigned_in_future

  def validate_assigned_period
    if assigned_date && due_date != nil
      if assigned_date >= due_date
        errors.add(:due_date, "must be later than the assigned_date")
      end
    end
  end

  def due_in_future
    if due_date != nil
      if due_date <= ActiveSupport::TimeWithZone.new(nil, Time.zone, DateTime.now)
        errors.add(:due_date, "must be in the future")
      end
    end
  end

  def assigned_in_future
    if assigned_date != nil
      if assigned_date <= ActiveSupport::TimeWithZone.new(nil, Time.zone, DateTime.now)
        errors.add(:assigned_date, "must be in the future")
      end
    end
  end
end
