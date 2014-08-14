require 'rails_helper'

# create_table "grading_periods", force: true do |t|
#     t.datetime "start_date"
#     t.datetime "end_date"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

RSpec.describe GradingPeriod, :type => :model do

  before do
    @grading_period = GradingPeriod.new(:start_date => DateTime.new(2012, 8, 1, 22, 35, 0), :end_date => DateTime.new(2014, 8, 1, 22, 35, 0))
  end
  subject(:grading_period) { @grading_period }

  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }

  it 'should have a DateTime for both .start_date and .end_date' do
    expect(@grading_period.start_date).to be_a(ActiveSupport::TimeWithZone)
    expect(@grading_period.end_date).to be_a(ActiveSupport::TimeWithZone)
  end

  it { is_expected.to be_valid }

  describe "when a start_date is not present" do
    before {@grading_period.start_date = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when a end_date is not present" do
    before {@grading_period.end_date = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when a start_date is after end_date" do
    before do
      @grading_period.start_date = DateTime.new(2014, 8, 5, 22, 35, 0)
      @grading_period.end_date = DateTime.new(2014, 8, 2, 22, 34, 0)
    end
    it { is_expected.to_not be_valid }
  end  

end



