require 'sinatra'
require 'sinatra/reloader'
require './lib/contacts'
require "./lib/address"
require "./lib/email"
require "./lib/phone_number"
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  @contacts = Contacts.all
  erb(:index)
end

post('/clear') do
  Contacts.clear
  redirect('/')
end

post('/contacts') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job_title = params.fetch('job_title')
  company = params.fetch('company')
  @contact = Contacts.new({:first_name => first_name,:last_name=>last_name,:job_title=>job_title,:company=>company})
  @contact.save
  redirect('/')
end

get('/contacts/:id') do
  @contact = Contacts.find(params.fetch("id"))
  erb(:contact)
end

post('/address') do
  type = params.fetch('type')
  street_address = params.fetch('street_address')
  city = params.fetch('city')
  state = params.fetch('state')
  zip_code = params.fetch('zip_code')
  @address = Address.new({:type=> type,:street_address=>street_address,:city=>city,:state=>state , :zip_code => zip_code})
  @address.save
  @contact = Contacts.find(params.fetch("id"))
  @contact.add_address(@address)
  redirect("/contacts/#{@contact.id()}")
end

get('/contacts/:id/address') do
  @contact = Contacts.find(params.fetch("id"))
  erb(:address)
end

post('/phone_number') do
  type = params.fetch('type')
  extension = params.fetch('extension')
  area_code = params.fetch('area_code')
  number = params.fetch('number')
  @phone_number = Phone_number.new({:type=> type,:extension=> extension,:area_code=>area_code,:number=>number})
  @phone_number.save
  @contact = Contacts.find(params.fetch("id"))
  @contact.add_phone_number(@phone_number)
  redirect("/contacts/#{@contact.id()}")
end

get('/contacts/:id/phone_number') do
  @contact = Contacts.find(params.fetch("id"))
  erb(:phone)
end

post('/email') do
  type = params.fetch('type')
  email_address = params.fetch('email_address')
  @email = Email.new({:type=> type,:email_address => email_address})
  @email.save
  @contact = Contacts.find(params.fetch("id"))
  @contact.add_email(@email)
  redirect("/contacts/#{@contact.id()}")
end

get('/contacts/:id/email') do
  @contact = Contacts.find(params.fetch("id"))
  erb(:email)
end
