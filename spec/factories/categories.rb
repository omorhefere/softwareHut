# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :category do 
    name        "Zero Failures"
    created_at  "02/04/2015"
    updated_at  "02/04/2015"
  end
end
