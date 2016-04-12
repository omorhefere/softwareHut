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
#

class Project < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory

  has_many :comments

  validates :project_title, :project_number, presence: true

  validates :funding, numericality: { greater_than: 0 }


  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end

end
