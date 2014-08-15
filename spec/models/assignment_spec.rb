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

  describe "An assignment" do
    before do
      @assignment = Assignment.new(due_date: DateTime.new(2020, 8, 5, 22, 35, 0), assigned_date: DateTime.new(2020, 8, 1, 22, 35, 0))
      @assignment.classroom = Classroom.new
      @assignment.worksheet = Worksheet.new
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

    describe "when a start date is before an assigned date" do
      before do 
        @assignment.assigned_date = DateTime.new(2014, 8, 5, 22, 35, 0)
        @assignment.due_date = DateTime.new(2014, 8, 2, 22, 34, 0)
        @assignment.save
      end
      it { is_expected.to_not be_valid }
      it { expect(@assignment.errors).to include(:due_date) }
    end

    describe "when an assigned date is before now" do
      before do 
        @assignment.assigned_date = DateTime.now - 1
        @assignment.due_date = DateTime.now + 1
        @assignment.save
      end
      it { is_expected.to_not be_valid }
      it { expect(@assignment.errors).to include(:assigned_date) }
    end

    describe "when a due date is before now" do
      before do 
        @assignment.assigned_date = DateTime.now - 2
        @assignment.due_date = DateTime.now - 1
        @assignment.save
      end
      it { is_expected.to_not be_valid }
      it { expect(@assignment.errors).to include(:due_date) }
    end
  end


end

