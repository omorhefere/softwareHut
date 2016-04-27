require 'rails_helper'

# Log in page tests
describe 'Log in as user' do
  specify 'I can login' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    expect(page).to have_content('All projects')
  end
end

describe 'Log in as admin' do
  specify 'I can view my profile' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Admin'
    click_link 'User'
    expect(page).to have_content('Your Profile')
  end
end

describe 'Forgot password' do
  specify 'I can retrieve password' do
    visit '/users/sign_in'
    click_button 'Forgot Password'
    expect(page).to have_content('Reset Password')
  end
end

#Forgot password page
describe 'Reset password' do
  specify 'I can reset my password' do
    visit '/forgot_password'
    fill_in 'Email', with: 'user@sheffield.ac.uk'
    #click_button 'Request reset'
    expect(page).to have_content('Reset Password')
    fill_in 'Email', with: 'user'
    #click_button 'Request reset'
    expect(page).to have_content('Reset Password')
  end
end


#Home page tests
describe 'Search button' do
  specify 'I can search a project in the database' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    expect(page).to have_content('Project 1')
    fill_in 'Search Projects', with: 'Project 2'
    click_button 'SearchButton'
    expect(page).to have_content('There are no projects')
  end
end

describe 'Categories' do
  specify 'I can pick category - All projects' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'All projects'
    expect(page).to have_content('All projects')
  end
end

describe 'Categories' do
  specify 'I can pick category - Zero Failures' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'Zero Failures'
    expect(page).to have_content('Zero Failures')
  end
end

describe 'Categories' do
  specify 'I can pick category - Resource, Recovery and Efficiency' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'Resource, Recovery and Efficiency'
    expect(page).to have_content('Resource, Recovery and Efficiency')
  end
end

describe 'Categories' do
  specify 'I can pick category - Buried Infrastructure Performance' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'Buried Infrastructure Performance'
    expect(page).to have_content('Buried Infrastructure Performance')
  end
end

describe 'Navbar Links' do
  specify 'I can click Home button' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Home'
    expect(page).to have_content('All projects')
  end
end

describe 'Navbar Links' do
  specify 'I can click Add Project button' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Add New Project'
    expect(page).to have_content('Please fill in the fields bellow to add a new project to the database.')
  end
end

describe 'Navbar Links' do
  specify 'I can click About us-> Introduction button' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'About us'
    click_link 'Introduction'
    expect(page).to have_content('Introduction')
  end
end

describe 'Navbar Links' do
  specify 'I can click About us-> Contact button' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'About us'
    click_link 'Contact'
    expect(page).to have_content('Contact')
  end
end

describe 'Navbar Links' do
  specify 'I can click User-> Log out' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'User'
    click_link 'Log Out'
    expect(page).to have_content('Log In')
  end
end

describe 'Invitation' do
  specify 'I can invite a new user' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Admin'
    click_link 'Invite'
    expect(page).to have_content('Invite new user')
  end
end

# Add new project page tests
describe 'Create project button' do
  specify 'I can create a new project' do
    user =FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    FactoryGirl.create(:category)
    FactoryGirl.create(:subcategory)
    visit '/projects/new'
    click_button 'Create Project'
    expect(page).to have_content('Please review the problems below:')
    visit '/projects/new'
    select 'Zero Failures', :from => "Category"
    select 'Knowledge', :from => "Subcategory"
    fill_in 'Project Number', with: '1'
    fill_in 'Project Title', with: 'Project 1'
    fill_in 'Priority and Duration', with: '12'
    fill_in 'Aims', with: 'Aims'
    fill_in 'Why is this project important', with: 'Importance'
    fill_in 'Targets of Members', with: 'Targets'
    fill_in 'Funding (eg. Venture Capital)', with: '12000'
    fill_in 'Time Scale (Years, eg. 2)', with: '12'
    fill_in 'Benefits', with: 'Benefits'
    fill_in 'Methodology', with: 'Methodology'
    fill_in 'Stage', with: 'Stage'
    fill_in 'Volunteers', with: 'Volunteers'
    click_button 'Create Project'
    expect(page).to have_content('Project was successfully created')
  end
end

#Invitation page tests
describe 'Invitation' do
  specify 'I should complete the right information in the field' do
    user = FactoryGirl.create(:user, admin: true)
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

#Contact page tests
describe 'Contact' do
  specify 'I can send a message' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/contact'
    fill_in 'Write Your Message Here', with: 'Message'
    click_button 'Send message'
    expect(page).to have_content('Cannot send message')
  end
end
