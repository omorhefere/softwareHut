require 'rails_helper'

#MANAGING Articles#
describe 'Show an article' do
  specify 'I can click on READ MORE to view an article' do
    FactoryGirl.create(:article)
    visit '/home'
    click_link 'Read More'
    expect(page).to have_no_content('Read More')
  end
end
