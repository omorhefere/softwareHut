require 'rails_helper'

describe 'Log in' do
  specify 'I can login' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'andreea@gmail.com'
    fill_in 'Password', with: '12341234'
    click_button 'Login'
    expect(page).to have_content('Signed in successfully.')
  end
end

describe 'Forgot password' do
  specify 'I can retrieve password' do
    visit '/users/sign_in'
    click_button 'Forgot Password'
    expect(page).to have_content('Reset Password')
  end
end

describe 'Search function' do
  specify 'I can search projects' do
    visit '/home'
    fill_in 'Search Projects', with: 'W'
    click_button 'Search'
    expect(page).to have_content('Search results')
  end
end

describe 'Sort projects by category' do
  specify 'See the category for all projects' do
    uri = URI.parse(current_url)
    "#{uri.path}/ck".should == '/'
    click_link 'Categories'
    click_link 'All projects'
    expect(page).to have_content('All projects')
  end
end
