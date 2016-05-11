require 'rails_helper'

#MANAGING Comments#
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
