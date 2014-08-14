require 'rails_helper'


# create_table "classrooms", force: true do |t|
#     t.integer  "teacher_id"
#     t.string   "title"
#     t.integer  "grading_period_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

RSpec.describe Classroom, :type => :model do
  
  describe "associations" do
    before do
      @classroom = Classroom.new(title: "Reading", )
      @classroom.teacher = Teacher.new
      @classroom.grading_period = GradingPeriod.new
    end

    subject(:classroom) { @classroom }
    it { is_expected.to respond_to(:title)}
    it { is_expected.to respond_to(:teacher)}
    it { is_expected.to respond_to(:grading_period)}

    it 'should belong to a teacher' do
      expect(@classroom.teacher).to be_a(Teacher)
    end

    it 'should belong to a grading_period' do
      expect(@classroom.grading_period).to be_a(GradingPeriod)
    end

    it { is_expected.to be_valid }

    describe "when a title is not present" do
      before {@classroom.title = nil }
      it { is_expected.to_not be_valid }
    end

    describe "when a grading_period is not present" do
      before {@classroom.grading_period = nil }
      it { is_expected.to_not be_valid }
    end

    describe "when a teacher is not present" do
      before {@classroom.teacher = nil }
      it { is_expected.to_not be_valid }
    end
  end
end

