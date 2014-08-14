require 'rails_helper'

# create_table "grading_periods", force: true do |t|
#     t.datetime "start_date"
#     t.datetime "end_date"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

RSpec.describe GradingPeriod, :type => :model do

  describe "instance variables" do
    it 'should belong have a DateTime for both .start_date and .end_date' do
      @grading_period = GradingPeriod.new(:start_date => DateTime.new(2012, 8, 1, 22, 35, 0), :end_date => DateTime.new(2014, 8, 1, 22, 35, 0))
      @grading_period.save
      expect(@grading_period.start_date).to be_a(DateTime)
      expect(@grading_period.end_date).to be_a(DateTime)
   end
  end
end



