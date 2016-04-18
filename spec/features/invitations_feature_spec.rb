require 'spec_helper'

describe 'invitations' do

  it 'shows invitation when user is invited' do
    fill_in 'Email', with: 'ooimoloame1@sheffield.ac.uk'
    click_button 'Invite User'
  end

  end
end
