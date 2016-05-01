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

class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

  has_attached_file :avatar, styles: { medium: "200x300>", thumb: "100x100>" }, default_url: "/images/logo.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
