require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the address form to', {:type => :feature}) do
  it('goes to home page and fills in contact information') do
    visit('/')
    fill_in('first_name', :with => 'sowmya')
    fill_in('last_name', :with => 'dinavahi')
    fill_in('job_title', :with => 'jr dev')
    fill_in('company', :with => 'epicodus')
    click_button('Add contact')
    expect(page).to have_content('sowmya dinavahi')
  end

  it('visit home page and click on contact link') do
    visit('/')
    click_on('sowmya dinavahi')
    expect(page).to have_content('sowmya dinavahi')
  end

  it('goes to the next page and lets the user enter address form') do
    visit('/contacts/contact1/address')
    select("home", :from => "type")
    fill_in('street_address', :with => 'dinavahi')
    fill_in('city', :with => 'portland')
    fill_in('state', :with => 'OR')
    fill_in('zip_code', :with => '97229')
    click_on('Add address')
    expect(page).to have_content('sowmya dinavahi Jobtitle: jr dev
Company: epicodus')
  end

  it('goes to the next page and lets the user enter phone number information') do
    visit('/contacts/contact1/phone_number')
    select("home", :from => "type")
    fill_in('extension', :with => '9999')
    fill_in('area_code', :with => '403')
    fill_in('number', :with => '309573155')
    click_on('Add phone-number')
    expect(page).to have_content("(403)309573155 ext:9999")
  end

  it('goes to the next page and lets the user enter email information') do
    visit('/contacts/contact1/email')
    select("home", :from => "type")
    fill_in('email_address', :with => 'sowmya.dsl@netsscape.com')
    click_on('Add email')
    expect(page).to have_content("sowmya.dsl@netsscape.com")
  end

end
