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

require 'rails_helper'

RSpec.describe Project, type: :model do

  it "Has - Project Number " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.project_number).to eq "1"
  end

  it "Has - Priority Duration " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.priority_duration).to eq "12"
  end

  it "Has - Project title " do
    category = FactoryGirl.create(:category)
    subcategory = FactoryGirl.create(:subcategory)
    project = FactoryGirl.create(:project)
    expect(project.project_title).to eq "Project 1"
  end


end
