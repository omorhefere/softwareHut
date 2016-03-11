require 'rails_helper'

describe 'Loging in' do
  specify 'I can login' do
    visit '/log_in_out'
    click_link 'Login'
  end
end

describe 'Log out' do
  specify 'I can log out' do
    visit '/home'
    click_link 'Log Out'
  end
end

describe 'Forgot password' do
  specify 'I can retrive password' do
    visit '/log_in_out'
    click_link 'Forgot Password'
  end
end

describe 'Add new project page' do
  specify 'I can visit add a project page' do
    visit '/home'
    click_link 'Add New Project'
  end
end

describe 'Invite page' do
  specify 'I can visit invite user page' do
    visit '/home'
    click_link 'Invite'
  end
end

describe 'Contact page' do
  specify 'I can visit contact page' do
    visit '/home'
    click_link 'Contact'
  end
end

describe 'Visit project page' do
  specify 'I can see details for project' do
    visit '/home'
    click_link 'See details'
  end
end

describe 'Add new project page' do
  specify 'I can visit add a project page' do
    visit '/home'
    click_link 'Add New Project'
  end
end

describe 'Filter all projects' do
  specify 'I can filter projects (All projects)' do
    visit '/home'
    click_link 'All projects'
  end
end

describe 'Filter Zero Failures' do
  specify 'I can filter projects (Zero Failures)' do
    visit '/home'
    click_link 'Zero Failures'
  end
end

describe 'Filter Resource Recovery and Efficiency' do
  specify 'I can filter projects (Resource Recovery and Efficiency)' do
    visit '/home'
    click_link 'Resource Recovery and Efficiency'
  end
end

describe 'Filter Buried Infrastructure Performance' do
  specify 'I can filter projects (Buried Infrastructure Performance)' do
    visit '/home'
    click_link 'Buried Infrastructure Performance'
  end
end
