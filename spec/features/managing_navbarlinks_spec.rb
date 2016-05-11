require 'rails_helper'

#MANAGING Navbar Links#
describe 'Navbar Links' do
  specify 'I can click Home button' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Home'
    expect(page).to have_content('All projects')
  end
end

describe 'Navbar Links' do
  specify 'I can click Add Project button' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Add New Project'
    expect(page).to have_content('Please fill in the fields bellow to add a new project to the database.')
  end
end

describe 'Navbar Links' do
  specify 'I can click About us-> Introduction button' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'About us'
    click_link 'Introduction'
    expect(page).to have_content('Introduction')
  end
end

describe 'Navbar Links' do
  specify 'I can click About us-> Contact button' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'About us'
    click_link 'Contact'
    expect(page).to have_content('Contact')
  end
end

describe 'Navbar Links' do
  specify 'I can click News' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'News'
    expect(page).to have_content('Recent News')
  end
end

describe 'Navbar Links' do
  specify 'I can click User-> Log out' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'User'
    click_link 'Log Out'
    expect(page).to have_content('Log In')
  end
end

#Errors handling
describe 'Error 403' do
  specify 'I get 403 error' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/403'
    expect(page).to have_content('Access Denied')
  end
end

describe 'Error 404' do
  specify 'I get 404 error' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/404'
    expect(page).to have_content('Not Found')
  end
end

describe 'Error 422' do
  specify 'I get 422 error' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/422'
    expect(page).to have_content('Change Rejected')
  end
end

describe 'Error 500' do
  specify 'I get 500 error' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/500'
    expect(page).to have_content('Server Error')
  end
end
