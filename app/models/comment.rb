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

class Comment < ActiveRecord::Base
  #Relationship
  belongs_to :project
  #Comments must have a body and commenter
  validates :commenter, :body, presence: true
end
