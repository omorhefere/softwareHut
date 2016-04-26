# == Schema Information
#
# Table name: subcategories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :subcategory do
<<<<<<< HEAD
    name        "Knowledge"
=======
    name        "Economic"
>>>>>>> 1668b2f692438c64bbc3fde9beac5edc73f034c6
    created_at  "02/04/2015"
    updated_at  "02/04/2015"
  end
end
