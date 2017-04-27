require "contacts"
require "rspec"
require "pry"


describe 'Contacts' do

  it "returns the empty array initially" do
    expect(Contacts.all()).to eq ([])
  end

  it "adds contact to contacts array" do
    contact = Contacts.new({:first_name => "Sowmya",:last_name=>"Dinavahi",:job_title=>"Jr Developer",:company=>"Epicodus"})
    expect(contact.save()).to eq ([contact])
  end

end
