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
#  benefits            :string
#  methodology         :string
#  stage               :string
#  volunteers          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#  subcategory_id      :integer
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
#  project_description :string
#

class Project < ActiveRecord::Base
  #Relationships
  belongs_to :category
  belongs_to :subcategory
  has_many :comments,  dependent: :destroy
  belongs_to :user

  #Attach and process 4 images for projects
  has_attached_file :image1, styles: { small: "100x100#" , medium: "500x500<" , large: "800x800<"}
  has_attached_file :image2, styles: { small: "100x100#" , medium: "500x500<"}
  has_attached_file :image3, styles: { small: "100x100#" , medium: "500x500<"}
  has_attached_file :image4, styles: { small: "100x100#" , medium: "500x500<"}
  validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image2, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image3, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image4, content_type: /\Aimage\/.*\Z/


  validates :category, :subcategory, :project_title, :project_number,  presence: true
  validates :time_scale, :numericality => {:allow_blank => true}
  validates :project_title, :project_number, uniqueness:true

  #Search function to use all fields of project
  def self.search(search)
    Project.where("project_title LIKE ? OR
                   project_number LIKE ? OR
                   aims LIKE ? OR
                   would_do_project LIKE ? OR
                   priority_duration LIKE ? OR
                   why_important LIKE ? OR
                   benefits LIKE ? OR
                   methodology LIKE ? OR
                   volunteers LIKE ?",
                   "%#{search.strip}%",
                   "%#{search.strip}%",
                   "%#{search.strip}%",
                   "%#{search.strip}%",
                   "%#{search.strip}%",
                   "%#{search.strip}%",
                   "%#{search.strip}%",
                   "%#{search.strip}%",
                   "%#{search.strip}%")
  end

end
