require "contacts"
require "rspec"
require "pry"


describe 'Contacts' do

  it "returns the empty array initially" do
    expect(Contacts.all()).to eq ([])
  end

end
