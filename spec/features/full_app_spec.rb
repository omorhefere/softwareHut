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

#describe 'Fail to login' do
#  specify 'I tipped in an invalid password' do
#    user1 = FactoryGirl.build(:user, :password => '00000000', approved: true)
#    user1.password
#    login_as(user1, :scope => :user, :run_callbacks => false)
#    visit '/home'
#    expect(page).to have_content('Invalid email or password')
#  end
#end

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
    page.should have_no_content('Read More')
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
describe 'Contact' do
  specify 'I can send a message' do
    user = FactoryGirl.create(:user, approved: true)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/contact'
    fill_in 'Write Your Message Here', with: 'Message'
    click_button 'Send message'
    expect(page).to have_content('Cannot send message')
  end
end

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
