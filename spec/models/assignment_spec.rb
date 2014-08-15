require 'rails_helper'

# create_table "assignments", force: true do |t|
#     t.integer  "classroom_id"
#     t.integer  "worksheet_id"
#     t.datetime "due_date"
#     t.datetime "assigned_date"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end
RSpec.describe Assignment, :type => :model do
  before do
    @assignment = Assignment.new(due_date: 1.day.from_now, assigned_date: Time.zone.now)
    @assignment.classroom = Classroom.new
    @assignment.worksheet = Worksheet.new
    @assignment.save
  end

  subject(:assignment) { @assignment }

  it { is_expected.to respond_to(:due_date)}
  it { is_expected.to respond_to(:assigned_date)}
  it { is_expected.to respond_to(:classroom)}
  it { is_expected.to respond_to(:worksheet)}

  it 'should belong to a classroom and a worksheet' do
    expect(@assignment.classroom).to be_a(Classroom)
    expect(@assignment.worksheet).to be_a(Worksheet)
  end

  it { is_expected.to be_valid }
  it "has no errors" do 
    expect(@assignment.errors.messages).to eq({})
  end

  describe "when a due date is not present" do
    before {@assignment.due_date = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when a start date is not present" do
    before {@assignment.assigned_date = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when a worksheet is not present" do
    before { @assignment.worksheet = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when a due date is before an assigned date" do
    before do 
      @assignment.assigned_date = Time.zone.parse("2014-08-05 22:35:00")
      @assignment.due_date = Time.zone.parse("2014-08-05 22:34:00")
      @assignment.save
    end
    it { is_expected.to_not be_valid }
    it { expect(@assignment.errors).to include(:due_date) }
  end

  describe "when an assigned date is before now" do
    before do 
      @assignment.assigned_date = 1.minute.ago
      @assignment.due_date = 1.minute.from_now
      @assignment.save
    end
    it { is_expected.to_not be_valid }
    it { expect(@assignment.errors).to include(:assigned_date) }
  end

  describe "when a due date is before now" do
    before do 
      @assignment.assigned_date = 2.minutes.ago
      @assignment.due_date = 1.minute.ago
      @assignment.save
    end
    it { is_expected.to_not be_valid }
    it { expect(@assignment.errors).to include(:due_date) }
  end
end

