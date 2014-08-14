require 'rails_helper'

# create_table "enrollments", force: true do |t|
#     t.integer  "student_id"
#     t.integer  "classroom_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

RSpec.describe Enrollment, :type => :model do
  
  describe "associations" do
    before do
      @enrollment = Enrollment.create
    end

    it 'should belong to a student and classroom' do
      @enrollment.student = Student.create
      @enrollment.classroom = Classroom.create
      expect(@enrollment.student).to be_a(Student)
      expect(@enrollment.classroom).to be_a(Classroom)
    end
  end
end