# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  project_number    :string
#  priority_duration :string
#  project_title     :string
#  aims              :string
#  why_important     :string
#  would_do_project  :string
#  funding           :string
#  time_scale        :string
#  benifits          :string
#  methodology       :string
#  stage             :string
#  volunteers        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_id       :integer
#  subcategory_id    :integer
#  image_remote_url  :string
#  user_id           :integer
#

class Project < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  has_many :comments
  belongs_to :user

  validates :category, :subcategory, :project_title, :project_number, :priority_duration, :aims, :why_important, :would_do_project, :time_scale, :benifits, :methodology, :stage, :volunteers,  presence: true
  validates :time_scale, numericality: { greater_than: 0 }
  validates :project_title, :project_number, uniqueness:true

  def self.search(search)
    where("project_title LIKE ?", "%#{search}%")
  end

end
