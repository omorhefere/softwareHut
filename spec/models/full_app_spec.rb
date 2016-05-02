require 'rails_helper'

#category

RSpec.describe Category, type: :model do
  it "Has Zero Failures category " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Zero Failures"
  end

  it "Has Resource, Recovery and Efficiencys category " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category, name: "Resource, Recovery and Efficiency")
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Resource, Recovery and Efficiency"
  end

  it "Has Buried Infrastructure Performance category " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category, name: "Buried Infrastructure Performance")
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Buried Infrastructure Performance"
  end

  it "has a Zero Failures Category & Economic subcategory " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory, name: "Economic")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Zero Failures"
    expect(project.subcategory.name).to eq "Economic"
  end

  it "has a Zero Failures Category & Technology subcategory " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory, name: "Technology")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Zero Failures"
    expect(project.subcategory.name).to eq "Technology"
  end

  it "has a Zero Failures Category & Knowledge subcategory " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory, name: "Knowledge")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Zero Failures"
    expect(project.subcategory.name).to eq "Knowledge"
  end

  it "has a Buried Infrastructure Performance Category & Economic subcategory " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category, name: "Buried Infrastructure Performance")
    subcategory = FactoryGirl.create(:subcategory, name: "Economic")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Buried Infrastructure Performance"
    expect(project.subcategory.name).to eq "Economic"
  end

  it "has a Buried Infrastructure Performance Category & Technology subcategory " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category, name: "Buried Infrastructure Performance")
    subcategory = FactoryGirl.create(:subcategory, name: "Technology")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Buried Infrastructure Performance"
    expect(project.subcategory.name).to eq "Technology"
  end

  it "has a Buried Infrastructure Performance Category & Knowledge subcategory " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category, name: "Buried Infrastructure Performance")
    subcategory = FactoryGirl.create(:subcategory, name: "Knowledge")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Buried Infrastructure Performance"
    expect(project.subcategory.name).to eq "Knowledge"
  end

  it "has a Resource, Recovery and Efficiencys Category & Economic subcategory " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category, name: "Resource, Recovery and Efficiencys")
    subcategory = FactoryGirl.create(:subcategory, name: "Economic")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Resource, Recovery and Efficiencys"
    expect(project.subcategory.name).to eq "Economic"
  end

  it "has a Resource, Recovery and Efficiencys Category & Technology subcategory " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category, name: "Resource, Recovery and Efficiencys")
    subcategory = FactoryGirl.create(:subcategory, name: "Technology")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Resource, Recovery and Efficiencys"
    expect(project.subcategory.name).to eq "Technology"
  end

  it "has a Resource, Recovery and Efficiencys Category & Knowledge subcategory " do
    user= FactoryGirl.create(:user)
    category = FactoryGirl.create(:category, name: "Resource, Recovery and Efficiencys")
    subcategory = FactoryGirl.create(:subcategory, name: "Knowledge")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Resource, Recovery and Efficiencys"
    expect(project.subcategory.name).to eq "Knowledge"
  end
end

#project

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
    user = FactoryGirl.create(:user)
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
    user = FactoryGirl.create(:user)
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
    user = FactoryGirl.create(:user)
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
    user = FactoryGirl.create(:user)
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
    user = FactoryGirl.create(:user)
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
    user = FactoryGirl.create(:user)
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
    user = FactoryGirl.create(:user)
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
    user = FactoryGirl.create(:user)
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
    user = FactoryGirl.create(:user)
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
    user = FactoryGirl.create(:user)
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
end

#comments
RSpec.describe Comment, type: :model do

  it "Add a comment to a project" do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    fill_in 'Enter your comment', with: 'comment'
    click_button 'Post'
    expect(page).to have_content('user@sheffield.ac.uk')
  end

  it "Has a count for comments posted" do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    fill_in 'Enter your comment', with: 'comment 1'
    click_button 'Post'
    fill_in 'Enter your comment', with: 'comment 2'
    click_button 'Post'
    expect(page).to have_content('2 Comments')
  end

end
