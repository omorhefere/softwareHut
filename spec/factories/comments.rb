# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :string
#  body       :text
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_project_id  (project_id)
#

FactoryGirl.define do
  factory :comment do
    commenter     "another_user@sheffield.ac.uk"
    body          "Simple comment"
    project_id    1
  end
end
