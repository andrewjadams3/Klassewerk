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
   
  
 before do
    @school = School.new(:code => "CODE-1234", :location => "Chi City", :mascot => "Wind", :name => "That Place")
  end

  subject(:school) { @school }
  it { is_expected.to respond_to(:code) }
  it { is_expected.to respond_to(:location) }
  it { is_expected.to respond_to(:mascot) }
  it { is_expected.to respond_to(:name) }

  it 'should have a code' do
    expect(@school.code).to eq("CODE-1234")
  end

  it 'should have a name' do
    expect(@school.name).to eq("That Place")
  end

  it 'should have a location' do
    expect(@school.location).to eq("Chi City")
  end

  it 'should have a mascot' do
    expect(@school.mascot).to eq("Wind")
  end

  it { is_expected.to be_valid }

  
  describe "Must have all validations" do
    before do
      @school = School.new(:code => "CODE-1234", :location => "Chi City", :mascot => "Wind")
    end
    it { is_expected.to_not be_valid }
  end  

end