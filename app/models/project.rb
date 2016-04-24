# == Schema Information
#
# Table name: projects
#
#  id                  :integer          not null, primary key
#  project_number      :string
#  priority_duration   :string
#  project_title       :string
#  aims                :string
#  why_important       :string
#  would_do_project    :string
#  funding             :string
#  time_scale          :string
#  benifits            :string
#  methodology         :string
#  stage               :string
#  volunteers          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#  subcategory_id      :integer
#  image_remote_url    :string
#  user_id             :integer
#  image1_file_name    :string
#  image1_content_type :string
#  image1_file_size    :integer
#  image1_updated_at   :datetime
#  image2_file_name    :string
#  image2_content_type :string
#  image2_file_size    :integer
#  image2_updated_at   :datetime
#  image3_file_name    :string
#  image3_content_type :string
#  image3_file_size    :integer
#  image3_updated_at   :datetime
#  image4_file_name    :string
#  image4_content_type :string
#  image4_file_size    :integer
#  image4_updated_at   :datetime
#

class Project < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  has_many :comments
  belongs_to :user

  has_attached_file :image1, styles: { medium: "500x500<" , large: "800x800<"}
  has_attached_file :image2, styles: { medium: "500x500<"}
  has_attached_file :image3, styles: { medium: "500x500<"}
  has_attached_file :image4, styles: { medium: "500x500<"}
  validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image2, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image3, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image4, content_type: /\Aimage\/.*\Z/

  validates :category, :subcategory, :project_title, :project_number, :priority_duration, :aims, :why_important, :would_do_project, :time_scale, :benifits, :methodology, :stage, :volunteers,  presence: true
  validates :time_scale, numericality: { greater_than: 0 }
  validates :project_title, :project_number, uniqueness:true

  def self.search(search)
    Project.where("project_title LIKE ?", "%#{search}%")
  end

end
