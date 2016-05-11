require 'rails_helper'

#MANAGING Users#
# Log in page tests
describe 'Log in as user' do
  specify 'I can login' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    expect(page).to have_content('All projects')
  end
end

describe 'Fail to login' do
  specify 'I do not have an approved account' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/users/sign_in'
    expect(page).to have_content('Your account has not been approved')
  end
end

describe 'Log in as admin' do
  specify 'I can view my profile' do
    user = FactoryGirl.create(:user, admin: true, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Admin'
    click_link 'User'
    expect(page).to have_content('Your Profile')
  end
end

#Invitation page tests
describe 'Invitation' do
  specify 'I should complete the right information in the field' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/users/invitation/new'
    fill_in 'Email', with: "new_user"
    click_button 'Send an invitation'
    expect(page).to have_content('Email is invalid')
    fill_in 'Email', with: "new_user@sheffield.ac.uk"
    click_button 'Send an invitation'
    expect(page).to have_content('An invitation email has been sent')
  end
end

# Admin area tests
describe 'Navigation - Articles' do
  specify 'I can see all the articles' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Articles'
    expect(page).to have_content('List of Articles')
  end
end

describe 'Navigation - categories' do
  specify 'I can see all the categories' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Categories'
    expect(page).to have_content('List of Categories')
  end
end

describe 'Navigation - Comments' do
  specify 'I can see all the comments' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Comments'
    expect(page).to have_content('List of Comments')
  end
end

describe 'Navigation - Projects' do
  specify 'I can see all the projects' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Projects'
    expect(page).to have_content('List of Projects')
  end
end

describe 'Navigation - Subcategories' do
  specify 'I can see all the subcategories' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Subcategories'
    expect(page).to have_content('List of Subcategories')
  end
end

describe 'Navigation - Users' do
  specify 'I can see all the users' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Users'
    expect(page).to have_content('List of Users')
  end
end

describe 'Navigation - Users' do
  specify 'I can see all the users' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin'
    click_link 'Users'
    expect(page).to have_content('List of Users')
  end
end

describe 'Filtering users' do
  specify 'I can filter the users' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin/user'
    fill_in 'Filter', with: "user@sheffield.ac.uk"
    click_button 'Refresh'
    expect(page).to have_content('user@sheffield.ac.uk')
  end
end

describe 'List link' do
  specify 'I can click link List' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin/user'
    click_link 'List'
    expect(page).to have_content('List of Users')
  end
end

describe 'Export Link' do
  specify 'I can click link Export' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin/user'
    click_link 'Export'
    expect(page).to have_content('Export Users')
  end
end

describe 'New Article' do
  specify 'I can create a new article' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin/article'
    click_link 'Add new'
    expect(page).to have_content('Save')
  end
end

describe 'Show user' do
  specify 'I can view profile of a user' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin/user/1'
    expect(page).to have_content('Details for')
  end
end

describe 'Edit user' do
  specify 'I can edit a user' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin/user/1/edit'
    expect(page).to have_content('Edit')
  end
end

describe 'Delete user' do
  specify 'I can delete a user' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/admin/user/1/delete'
    expect(page).to have_content('Delete')
  end
end
