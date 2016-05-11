require 'rails_helper'

RSpec.describe Project, type: :model do

  it "Has - Project Number " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.project_number).to eq "1"
  end

  it "Has - Priority Duration " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.priority_duration).to eq "12"
  end

  it "Has - Project title " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.project_title).to eq "Project 1"
  end

  it "Has - Project title " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.project_title).to eq "Project 1"
  end

  it "Search by - Project title " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    expect(page).to have_content('Project 1')
  end

  it "Search by - Project number " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: '1'
    click_button 'SearchButton'
    click_link 'Show'
    expect(page).to have_content('Project number: 1')
  end

  it "Search by - Project number & has Description " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: '1'
    click_button 'SearchButton'
    click_link 'Show'
    expect(page).to have_content('Project description:')
  end

  it "Search by - Project aims " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'aims'
    click_button 'SearchButton'
    click_link 'Show'
    expect(page).to have_content('Aims: aims')
  end

  it "Search by - Would do " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'would do'
    click_button 'SearchButton'
    click_link 'Show'
    expect(page).to have_content('would do')
  end

  it "Search by - Priority duration " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: '12'
    click_button 'SearchButton'
    click_link 'Show'
    expect(page).to have_content('Priority & duration? 12')
  end

  it "Search by - Why important " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'important'
    click_button 'SearchButton'
    click_link 'Show'
    expect(page).to have_content('important')
  end

  it "Search by - Benefits " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'benefits'
    click_button 'SearchButton'
    click_link 'Show'
    expect(page).to have_content('benefits')
  end

  it "Search by - Methodology " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'methodology'
    click_button 'SearchButton'
    click_link 'Show'
    expect(page).to have_content('methodology')
  end

  it "Search by - Volunteers " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'volunteers'
    click_button 'SearchButton'
    click_link 'Show'
    expect(page).to have_content('volunteers')
  end

  it "Update project " do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link 'Edit'
    fill_in 'Project Description', with: 'Description'
    click_button 'Update Project'
    expect(page).to have_content('Project was successfully updated')
  end

  it "Failed to update project if field is fileld incorrectly" do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link 'Edit'
    fill_in 'Time Scale (Years, eg. 2)', with: 'Description'
    click_button 'Update Project'
    expect(page).to have_button('Update Project')
  end

  it "Fail to update project " do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link 'Edit'
    fill_in 'Project Number', with: ''
    click_button 'Update Project'
    expect(page).to have_content('Please review')
  end

  it "Create new project " do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit'/home'
    click_link 'Add New Project'
    fill_in 'Project Title', with: 'Project 2'
    fill_in 'Project Number', with: '2'
    select "Zero Failures", :from => "Category"
    select "Knowledge", :from => "Subcategory"
    click_button 'Create Project'
  end

  it "Fail to create new project " do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit'/home'
    click_link 'Add New Project'
    fill_in 'Project Number', with: '2'
    select "Zero Failures", :from => "Category"
    select "Knowledge", :from => "Subcategory"
    click_button 'Create Project'
    expect(page).to have_content('Please review')
  end

  it "Delete project " do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link 'Delete'
    expect(page).to have_content('Project was successfully destroyed')
  end

  it " Add 4 images to project" do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link 'Edit'
    attach_file('project_image1', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image2', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image3', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image4', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    expect(page).to have_content('Project was successfully updated')
  end

  it " Add 1 image to project" do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link 'Edit'
    attach_file('project_image1', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    expect(page).to have_content('Project was successfully updated')
  end

  it " Delete 1 image from project" do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link 'Edit'
    attach_file('project_image1', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    click_link 'Edit'
    click_link 'Delete primary image'
    expect(page).to have_content('Project 1')
  end

  it "Delete image 2 from project" do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link 'Edit'
    attach_file('project_image1', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image2', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    click_link 'Edit'
    click_link 'Delete image 2'
    expect(page).to have_content('Project 1')
  end

  it " Delete image 3 from project" do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link 'Edit'
    attach_file('project_image1', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image2', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image3', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    click_link 'Edit'
    click_link 'Delete image 3'
    expect(page).to have_content('Project 1')
  end

  it " Delete image 4 from project" do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link 'Edit'
    attach_file('project_image1', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image2', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image3', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    attach_file('project_image4', File.absolute_path('./images-of-flowers-and-butterflies-5.jpg'), visible: false)
    click_button 'Update Project'
    click_link 'Edit'
    click_link 'Delete image 4'
    expect(page).to have_content('Project 1')
  end
end
