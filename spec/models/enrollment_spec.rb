# require 'rails_helper'

# # create_table "enrollments", force: true do |t|
# #     t.integer  "student_id"
# #     t.integer  "classroom_id"
# #     t.datetime "created_at"
# #     t.datetime "updated_at"
# #   end

# RSpec.describe Enrollment, :type => :model do
#   before do
#     @enrollment = Enrollment.new
#     @enrollment.student = Student.new
#     @enrollment.classroom = Classroom.new
#     @enrollment.save
#   end

#   subject(:enrollment) { @enrollment }
#   it { is_expected.to respond_to(:student)}
#   it { is_expected.to respond_to(:classroom)}

#   it 'should belong to a student and classroom' do
#     expect(@enrollment.student).to be_a(Student)
#     expect(@enrollment.classroom).to be_a(Classroom)
#   end

#   it { is_expected.to be_valid }
#   it "has no errors" do
#     expect(@enrollment.errors.messages).to eq({})
#   end

#   describe "when a student is not present" do
#     before {@enrollment.student = nil }
#     it { is_expected.to_not be_valid }
#   end

#   describe "when a classroom is not present" do
#     before {@enrollment.classroom = nil }
#     it { is_expected.to_not be_valid }
#   end
# end
