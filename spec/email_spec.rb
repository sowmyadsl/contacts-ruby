require "email"
require "phone_number"
require "contacts"
require "address"
require "rspec"
require "pry"

describe 'email' do
  before() do
    Email.clear()
  end

  it "returns the empty array initially" do
    expect(Email.all()).to eq ([])
  end

  it "adds email to emails array" do
    email = Email.new({:type=> "home",:email_address => "sowmya.dsl@gmail.com"})
    expect(email.save()).to eq ([email])
  end

  it "clears the emails array" do
    email = Email.new({:type=> "home",:email_address => "sowmya.dsl@gmail.com"})
    email.save()
    expect(Email.clear()).to eq ([])
  end

  it("returns the id for emails") do
    email = Email.new({:type=> "home",:email_address => "sowmya.dsl@gmail.com"})
    expect(email.id()).to(eq("email1"))
  end

  describe(".find") do
    it("returns a email by its id number") do
      email = Email.new({:type=> "home",:email_address => "sowmya.dsl@gmail.com"})
      email.save()
      email2 = Email.new({:type=> "home",:email_address => "sowmya.dsl@gmail.com"})
      email2.save()
      expect(Email.find(email.id())).to(eq(email))
    end
  end
end
