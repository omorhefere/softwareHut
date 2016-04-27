require 'rails_helper'

# Admin area tests
describe 'Navigation - categories' do
  specify 'I can see all the categories' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Categories'
    expect(page).to have_content('List of Categories')
  end
end

describe 'Navigation - Comments' do
  specify 'I can see all the comments' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Comments'
    expect(page).to have_content('List of Comments')
  end
end

describe 'Navigation - Projects' do
  specify 'I can see all the projects' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Projects'
    expect(page).to have_content('List of Projects')
  end
end

describe 'Navigation - Subcategories' do
  specify 'I can see all the subcategories' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Subcategories'
    expect(page).to have_content('List of Subcategories')
  end
end

describe 'Navigation - Users' do
  specify 'I can see all the users' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Users'
    expect(page).to have_content('List of Users')
  end
end
