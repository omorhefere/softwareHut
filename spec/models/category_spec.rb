# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

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
    subcategory = FactoryGirl.create(:subcategory)
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
    subcategory = FactoryGirl.create(:subcategory)
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
end
