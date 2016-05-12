# == Schema Information
#
# Table name: subcategories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#Subcategories are managed via Rails admin
class Subcategory < ActiveRecord::Base
end
