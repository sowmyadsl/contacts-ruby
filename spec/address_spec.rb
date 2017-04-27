require "address"
require "contacts"
require "email"
require "phone_number"
require "rspec"
require "pry"

describe 'Address' do

  it "returns the empty array initially" do
    expect(Address.all()).to eq ([])
  end

  it "adds address to addresses array" do
    address = Address.new({:type=> "home",:street_address=>"6771 NW 163rd ave",:city=>"Portland",:state=>"OR" , :zip_code => "97229"})
    expect(address.save()).to eq ([address])
  end

  it "clears the addresses array" do
    address = Address.new({:type=> "home",:street_address=>"6771 NW 163rd ave",:city=>"Portland",:state=>"OR" , :zip_code => "97229"})
    address.save()
    expect(Address.clear()).to eq ([])
  end

  it("returns the id for addresses") do
    address = Address.new({:type=> "home",:street_address=>"6771 NW 163rd ave",:city=>"Portland",:state=>"OR" , :zip_code => "97229"})
    expect(address.id()).to(eq("address1"))
  end

  describe(".find") do
    it("returns a address by its id number") do
      address = Address.new({:type=> "home",:street_address=>"6771 NW 163rd ave",:city=>"Portland",:state=>"OR" , :zip_code => "97229"})
      address.save()
      address2 = Address.new({:type=> "home",:street_address=>"6771 NW 163rd ave",:city=>"Portland",:state=>"OR" , :zip_code => "97229"})
      address2.save()
      expect(Address.find(address.id())).to(eq(address))
    end
  end
end
