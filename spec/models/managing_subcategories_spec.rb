require 'rails_helper'

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
