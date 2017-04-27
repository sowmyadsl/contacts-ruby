require "contacts"
require "address"
require "email"
require "phone_number"
require "rspec"
require "pry"


describe 'Contacts' do
  before() do
    Contacts.clear()
  end

  it "returns the empty array initially" do
    expect(Contacts.all()).to eq ([])
  end

  it "adds contact to contacts array" do
    contact = Contacts.new({:first_name => "Sowmya",:last_name=>"Dinavahi",:job_title=>"Jr Developer",:company=>"Epicodus"})
    expect(contact.save()).to eq ([contact])
  end

  it "clears the contacts array" do
    contact = Contacts.new({:first_name => "Sowmya",:last_name=>"Dinavahi",:job_title=>"Jr Developer",:company=>"Epicodus"})
    contact.save()
    expect(Contacts.clear()).to eq ([])
  end

  it("returns the id for contacts") do
    contact = Contacts.new({:first_name => "Sowmya",:last_name=>"Dinavahi",:job_title=>"Jr Developer",:company=>"Epicodus"})
    expect(contact.id()).to(eq("contact1"))
  end

  describe('#add_address') do
    it('will add an address to the contact') do
      contact = Contacts.new({:first_name => "Sowmya",:last_name=>"Dinavahi",:job_title=>"Jr Developer",:company=>"Epicodus"})
      address = Address.new({:type=> "home",:street_address=>"6771 NW 163rd ave",:city=>"Portland",:state=>"OR" , :zip_code => "97229"})
      expect(contact.add_address(address)).to(eq([address]))
    end
  end

  describe('#add_phone_number') do
    it('will add an phone_number to the contact') do
      contact = Contacts.new({:first_name => "Sowmya",:last_name=>"Dinavahi",:job_title=>"Jr Developer",:company=>"Epicodus"})
      phone_number = Phone_number.new({:type=> "home",:extension=> "891",:area_code=>"503",:number=>"4567890"})
      expect(contact.add_phone_number(phone_number)).to(eq([phone_number]))
    end
  end

  describe('#add_email') do
    it('will add an email to the contact') do
      contact = Contacts.new({:first_name => "Sowmya",:last_name=>"Dinavahi",:job_title=>"Jr Developer",:company=>"Epicodus"})
      email = Email.new({:type=> "home",:email_address => "sowmya.dsl@gmail.com"})
      expect(contact.add_email(email)).to(eq([email]))
    end
  end

  describe(".find") do
    it("returns a contact by its id number") do
      contact = Contacts.new({:first_name => "Sowmya",:last_name=>"Dinavahi",:job_title=>"Jr Developer",:company=>"Epicodus"})
      contact.save()
      contact2 = Contacts.new({:first_name => "Sowmya",:last_name=>"Dinavahi",:job_title=>"Jr Developer",:company=>"Epicodus"})
      contact2.save()
      expect(Contacts.find(contact.id())).to(eq(contact))
    end
  end
end
