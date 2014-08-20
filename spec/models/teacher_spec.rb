require 'rails_helper'

# create_table "teachers", force: true do |t|
#     t.string   "first_name"
#     t.string   "last_name"
#     t.string   "email"
#     t.string   "class_code"
#     t.string   "password_digest"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

RSpec.describe Teacher, :type => :model do
  before do
    @teacher = Teacher.new(
      :first_name => "Bill", 
      :last_name => "Teacher", 
      :password => "password", 
      :email => "email@email.com", 
      :class_code => "123-456")
    @teacher.save
  end

  subject(:teacher) { @teacher }
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:password_digest) }
  it { is_expected.to respond_to(:class_code) }
  it { is_expected.to respond_to(:email) }
  
  it { is_expected.to be_valid }

  it "has no errors" do
    expect(@teacher.errors.messages).to eq({})
  end

end
