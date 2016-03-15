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
#

require 'rails_helper'

RSpec.describe Project, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
