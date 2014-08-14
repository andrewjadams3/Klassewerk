class CreateGradingPeriods < ActiveRecord::Migration
  def change
    create_table :grading_periods do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
