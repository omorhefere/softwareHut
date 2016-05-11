require 'rails_helper'

#MANAGING Projects#
#Home page tests
describe 'Search button' do
  specify 'I can search a project in the database' do
    user = FactoryGirl.create(:user, approved: true)
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
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'All projects'
    expect(page).to have_content('All projects')
  end
end

describe 'Categories' do
  specify 'I can pick category - Zero Failures' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'Zero Failures'
    expect(page).to have_content('Zero Failures')
  end
end

describe 'Categories' do
  specify 'I can pick category - Resource Recovery and Efficiency' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'Resource Recovery and Efficiency'
    expect(page).to have_content('Resource Recovery and Efficiency')
  end
end

describe 'Categories' do
  specify 'I can pick category - Buried Infrastructure Performance' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Categories'
    click_link 'Buried Infrastructure Performance'
    expect(page).to have_content('Buried Infrastructure Performance')
  end
end

describe 'Show a project' do
  specify 'I can click on SHOW button to view a project' do
    user = FactoryGirl.create(:user, approved: true)
    FactoryGirl.create(:category)
    FactoryGirl.create(:subcategory)
    FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Show'
    expect(page).to have_content('Join the discussion')
  end
end

describe 'Edit project' do
  specify 'I can edit a project' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    FactoryGirl.create(:category)
    FactoryGirl.create(:subcategory)
    FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/projects/1'
    click_link('Edit')
    expect(page).to have_current_path('/projects/1/edit')
  end
end

describe 'Delete project' do
  specify 'I can delete a project' do
    user = FactoryGirl.create(:user,approved: true, admin: true)
    FactoryGirl.create(:category)
    FactoryGirl.create(:subcategory)
    FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/projects/1'
    click_link('Delete')
    expect(page).to have_content('Project was successfully destroyed')
  end
end

describe 'Upload images' do
  specify 'I can upload images' do
    user = FactoryGirl.create(:user, approved: true, admin: true)
    FactoryGirl.create(:category)
    FactoryGirl.create(:subcategory)
    FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/projects/1'
    click_link('click here')
    expect(page).to have_current_path('/projects/1/edit')
  end
end

describe 'Update project' do
  specify 'I can update a project' do
    user = FactoryGirl.create(:user, approved: true, admin: true)
    FactoryGirl.create(:category)
    FactoryGirl.create(:subcategory)
    FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/projects/1/edit'
    fill_in 'Project Title', with: 'Project 2'
    click_button ('Update Project')
    expect(page).to have_content('Project was successfully updated.')
  end
end

describe 'Upload images' do
  specify 'I can add images to project' do
    user = FactoryGirl.create(:user, admin: true, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    visit '/projects/1/edit'
    attach_file('project_image1', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image2', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image3', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image4', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    expect(page).to have_content('Project was successfully updated')
  end
end

describe 'Remove images' do
  specify 'I can remove images from project' do
    user = FactoryGirl.create(:user, admin: true, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    visit '/projects/1/edit'
    attach_file('project_image1', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    click_link 'Edit'
    click_link 'Delete primary image'
    visit '/projects/1/edit'
    attach_file('project_image2', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    click_link 'Edit'
    click_link 'Delete image 2'
    visit '/projects/1/edit'
    attach_file('project_image3', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    click_link 'Edit'
    click_link 'Delete image 3'
    visit '/projects/1/edit'
    attach_file('project_image4', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    click_link 'Edit'
    click_link 'Delete image 4'
    expect(page).to have_content('To upload an image click here')
  end
end

# Add new project page tests
describe 'Create project button' do
  specify 'I can create a new project' do
    user =FactoryGirl.create(:user, approved: true)
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
