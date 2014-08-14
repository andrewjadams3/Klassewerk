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
      @classroom = Classroom.create
    end

    it 'should belong to a teacher' do
      @classroom.teacher = Teacher.create
      expect(@classroom.teacher).to be_a(Teacher)
    end
  end
end

