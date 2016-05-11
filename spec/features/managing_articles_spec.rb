require 'rails_helper'

#MANAGING Articles#
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
