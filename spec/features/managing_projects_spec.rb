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
