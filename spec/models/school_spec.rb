require 'rails_helper'


# create_table "schools", force: true do |t|
#     t.string   "code"
#     t.string   "location"
#     t.string   "name"
#     t.string   "mascot"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

RSpec.describe School, :type => :model do
   describe "instance variables" do
    it 'should have a code' do
      @school = School.create(:code => "CODE-1234")
      expect(@school.code).to eq("CODE-1234") 
    end
  end
end