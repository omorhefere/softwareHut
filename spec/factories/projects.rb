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

FactoryGirl.define do
  factory :project do
    project_number       "1"
    priority_duration    "12"
    project_title        "Project 1"
    aims                 "aims"
    why_important        "important"
    would_do_project     "would do"
    funding              "123"
    time_scale           "12"
    benefits             "benefits"
    methodology          "methodology"
    stage                "stage"
    volunteers           "volunteers"
    category_id          "1"
    subcategory_id       "1"
  end
end
