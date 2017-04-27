require "email"
require "rspec"
require "pry"

describe 'email' do

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
    expect(email.id()).to(eq(1))
  end
end
