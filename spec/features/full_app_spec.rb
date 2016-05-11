require 'rails_helper'

#MANAGING Projects#
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

describe 'Invitation' do
  specify 'I can invite a new user' do
    user = FactoryGirl.create(:user, approved: true, admin: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'Admin'
    click_link 'Invite'
    expect(page).to have_content('Invite new user')
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

describe 'Show an article' do
  specify 'I can click on READ MORE button to view an article' do
    user = FactoryGirl.create(:user, approved: true)
    FactoryGirl.create(:article)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/home'
    click_link 'News'
    click_link 'Read More'
    expect(page).to have_no_content('Read More')
  end
end

# Project show page tests
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

describe 'Comment on project' do
  specify 'I can leave a commment' do
    user = FactoryGirl.create(:user, approved: true)
    FactoryGirl.create(:category)
    FactoryGirl.create(:subcategory)
    FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/projects/1'
    fill_in 'Enter your comment', with:'A comment'
    click_button('Post')
    expect(page).to have_content('A comment')
  end
end

describe 'Delete comment on project' do
  specify 'I can delete my own comments' do
    user = FactoryGirl.create(:user, approved: true)
    FactoryGirl.create(:category)
    FactoryGirl.create(:subcategory)
    FactoryGirl.create(:project)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/projects/1'
    fill_in 'Enter your comment', with:'A comment'
    click_button('Post')
    click_link('')
    expect(page).to have_no_content('A comment')
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

#Contact page tests
#describe 'Contact' do
#  specify 'I can send a message' do
#    user = FactoryGirl.create(:user, approved: true)
#    login_as(user, :scope => :user, :run_callbacks => false)
#    visit '/contact'
#    fill_in 'Write Your Message Here', with: 'Message'
#    click_button 'Send message'
#    expect(page).to have_content('Cannot send message')
#  end
#end

#MANAGING USERS#
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

#category
RSpec.describe Category, type: :model do
  it "Has Zero Failures category " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Zero Failures"
  end

  it "Has Resource, Recovery and Efficiencys category " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category, name: "Resource, Recovery and Efficiency")
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Resource, Recovery and Efficiency"
  end

  it "Has Buried Infrastructure Performance category " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category, name: "Buried Infrastructure Performance")
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Buried Infrastructure Performance"
  end

  it "has a Zero Failures Category & Economic subcategory " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory, name: "Economic")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Zero Failures"
    expect(project.subcategory.name).to eq "Economic"
  end

  it "has a Zero Failures Category & Technology subcategory " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory, name: "Technology")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Zero Failures"
    expect(project.subcategory.name).to eq "Technology"
  end

  it "has a Zero Failures Category & Knowledge subcategory " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory, name: "Knowledge")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Zero Failures"
    expect(project.subcategory.name).to eq "Knowledge"
  end

  it "has a Buried Infrastructure Performance Category & Economic subcategory " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category, name: "Buried Infrastructure Performance")
    subcategory = FactoryGirl.create(:subcategory, name: "Economic")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Buried Infrastructure Performance"
    expect(project.subcategory.name).to eq "Economic"
  end

  it "has a Buried Infrastructure Performance Category & Technology subcategory " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category, name: "Buried Infrastructure Performance")
    subcategory = FactoryGirl.create(:subcategory, name: "Technology")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Buried Infrastructure Performance"
    expect(project.subcategory.name).to eq "Technology"
  end

  it "has a Buried Infrastructure Performance Category & Knowledge subcategory " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category, name: "Buried Infrastructure Performance")
    subcategory = FactoryGirl.create(:subcategory, name: "Knowledge")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Buried Infrastructure Performance"
    expect(project.subcategory.name).to eq "Knowledge"
  end

  it "has a Resource, Recovery and Efficiencys Category & Economic subcategory " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category, name: "Resource, Recovery and Efficiencys")
    subcategory = FactoryGirl.create(:subcategory, name: "Economic")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Resource, Recovery and Efficiencys"
    expect(project.subcategory.name).to eq "Economic"
  end

  it "has a Resource, Recovery and Efficiencys Category & Technology subcategory " do
    user= FactoryGirl.create(:user, approved: "true")
    category = FactoryGirl.create(:category, name: "Resource, Recovery and Efficiencys")
    subcategory = FactoryGirl.create(:subcategory, name: "Technology")
    project = FactoryGirl.create(:project)
    expect(project.category.name).to eq "Resource, Recovery and Efficiencys"
    expect(project.subcategory.name).to eq "Technology"
  end

  it "has a Resource, Recovery and Efficiencys Category & Knowledge subcategory " do
    user= FactoryGirl.create(:user, approved: "true")
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

#comments
RSpec.describe Comment, type: :model do

  it "Add a comment to a project" do
    user= FactoryGirl.create(:user, approved: "true")
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
    user= FactoryGirl.create(:user, approved: "true")
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

  it " Add comment and delete comment" do
    user= FactoryGirl.create(:user, admin: true, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    fill_in 'Enter your comment', with: 'comment 1'
    click_button 'Post'
    click_link ''
  end

  it " Admin adds comment and user can not delete comment" do
    user = FactoryGirl.create(:user, approved: "true")
    login_as(user, :scope => :user, :run_callbacks => false)
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project, project_number: '1')
    comment = FactoryGirl.create(:comment)
    visit '/home'
    fill_in 'Search Projects', with: 'Project 1'
    click_button 'SearchButton'
    click_link 'Show'
    click_link ''
    expect(page).not_to have_content('Delete')
  end
end

#subcategory
RSpec.describe Subcategory, type: :model do
  it "Has Knowledge subcategory " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.subcategory.name).to eq "Knowledge"
  end

  it "Has Technology subcategory " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory, name: 'Technology')
    project = FactoryGirl.create(:project)
    expect(project.subcategory.name).to eq "Technology"
  end

  it "Has Economic subcategory " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory, name: 'Economic')
    project = FactoryGirl.create(:project)
    expect(project.subcategory.name).to eq "Economic"
  end
end
