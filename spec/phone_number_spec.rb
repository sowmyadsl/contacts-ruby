require "phone_number"
require "contacts"
require "address"
require "email"
require "rspec"
require "pry"

describe 'phone_number' do

  it "returns the empty array initially" do
    expect(Phone_number.all()).to eq ([])
  end

  it "adds phone number to phone numbers array" do
    phone_number = Phone_number.new({:type=> "home",:extension=> "891",:area_code=>"503",:number=>"4567890"})
    expect(phone_number.save()).to eq ([phone_number])
  end

  it "clears the phone numbers array" do
    phone_number = Phone_number.new({:type=> "home",:extension=> "891",:area_code=>"503",:number=>"4567890"})
    phone_number.save()
    expect(Phone_number.clear()).to eq ([])
  end

  it("returns the id for phone_numbers") do
    phone_number = Phone_number.new({:type=> "home",:extension=> "891",:area_code=>"503",:number=>"4567890"})
    expect(phone_number.id()).to(eq("phone_number1"))
  end

  describe(".find") do
    it("returns a phone_number by its id number") do
      phone_number = Phone_number.new({:type=> "home",:extension=> "891",:area_code=>"503",:number=>"4567890"})
      phone_number.save()
      phone_number2 = Phone_number.new({:type=> "home",:extension=> "891",:area_code=>"503",:number=>"4567890"})
      phone_number2.save()
      expect(Phone_number.find(phone_number.id())).to(eq(phone_number))
    end
  end

end
