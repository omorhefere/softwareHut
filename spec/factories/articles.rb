# == Schema Information
#
# Table name: articles
#
#  id                  :integer          not null, primary key
#  title               :string
#  text                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

FactoryGirl.define do
  factory :article do
    title "Example"
    text "Example"
  end
end
