require 'rails_helper'

###USER###
# Home page tests
describe 'Log in as user' do
  specify 'I can login' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    expect(page).to have_content('All projects')
  end
end

describe 'Forgot password' do
  specify 'I can retrieve password' do
    visit '/users/sign_in'
    click_button 'Forgot Password'
    expect(page).to have_content('Reset Password')
  end
end

describe 'Search button' do
  specify 'Search a project successfully' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    expect(page).to have_content('Project 1')
  end
end

describe 'Search button' do
  specify 'Search a project unsuccessfully' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'Project 2'
    click_button 'SearchButton'
    expect(page).to have_content('There are no projects')
  end
end

describe 'Categories' do
  specify 'Pick category - All projects' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'All projects'
    expect(page).to have_content('All projects')
  end
end

describe 'Categories' do
  specify 'Pick category - Zero Failures' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'Zero Failures'
    expect(page).to have_content('Zero Failures')
  end
end

describe 'Categories' do
  specify 'Pick category - Resource, Recovery and Efficiency' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'Resource, Recovery and Efficiency'
    expect(page).to have_content('Resource, Recovery and Efficiency')
  end
end

describe 'Categories' do
  specify 'Pick category - Buried Infrastructure Performance' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'Buried Infrastructure Performance'
    expect(page).to have_content('Buried Infrastructure Performance')
  end
end

describe 'Navbar Links' do
  specify 'Click Home' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Home'
    expect(page).to have_content('All projects')
  end
end

describe 'Navbar Links' do
  specify 'Click Add Project' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Add New Project'
    expect(page).to have_content('Please fill in the fields bellow to add a new project to the database.')
  end
end

describe 'Navbar Links' do
  specify 'Click About us-> Introduction' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'About us'
    click_link 'Introduction'
    expect(page).to have_content('Introduction')
  end
end

describe 'Navbar Links' do
  specify 'Click About us-> Contact' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'About us'
    click_link 'Contact'
    expect(page).to have_content('Contact')
  end
end

describe 'Navbar Links' do
  specify 'Click User-> Log out' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'User'
    click_link 'Log Out'
    expect(page).to have_content('Log In')
  end
end

# Add new project page tests
describe 'Create project button' do
  specify 'Fail to create project' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/projects/new'
    click_button 'Create Project'
    expect(page).to have_content('Please review the problems below:')
  end
end

describe 'Create Project button' do
  specify 'Project successfully created' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/projects/new'
    select 'Zero Failures', :from => "Category"
    select 'Knowledge', :from => "Subcategory"
    fill_in 'Project Number', with: '1'
    fill_in 'Project Title', with: 'Project 1'
    fill_in 'Priority and Duration', with: '12'
    fill_in 'Aims', with: 'Aims'
    fill_in 'Why is this project important', with: 'Importance'
    fill_in 'Targets of Members', with: 'Targets'
    fill_in 'Funding', with: '12000'
    fill_in 'Time Scale', with: '12'
    fill_in 'Benefits', with: 'Benefits'
    fill_in 'Methodology', with: 'Methodology'
    fill_in 'Stage', with: 'Stage'
    fill_in 'Volunteers', with: 'Volunteers'
    click_button 'Create Project'
    expect(page).to have_content('Project was successfully created')
  end
end

###ADMIN###
#Home page tests
describe 'Admin profile' do
  specify 'I can view my profile' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Admin'
    click_link 'User'
    expect(page).to have_content('Your Profile')
  end
end
