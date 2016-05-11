require 'rails_helper'

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
