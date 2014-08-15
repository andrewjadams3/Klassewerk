require 'rails_helper'

 # create_table "worksheets", force: true do |t|
 #    t.string   "url"
 #    t.json     "input_fields"
 #    t.json     "answer_key"
 #    t.datetime "created_at"
 #    t.datetime "updated_at"
 #  end

RSpec.describe Worksheet, :type => :model do
   describe "associations" do
    it 'should store .answer_key and .input_fields as json objects' do
      @worksheet = Worksheet.new(:input_fields => {input_fields: "blah"}.to_json, :answer_key => Response.new.to_json)
      expect(@worksheet.input_fields).to be_a(Hash)
      expect(@worksheet.answer_key).to be_a(Hash)
    end
  end
end

