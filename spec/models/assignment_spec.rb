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

  describe "associations" do
    before do
      @assignment = Assignment.create
    end

    it 'should belong to a classroom and a worksheet' do
      @assignment.classroom = Classroom.create
      @assignment.worksheet = Worksheet.create
      @assignment.save
      expect(@assignment.classroom).to be_a(Classroom)
      expect(@assignment.worksheet).to be_a(Worksheet)
    end
  end
end

