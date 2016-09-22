# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  post_number :string
#  detail      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Address < ActiveRecord::Base
end
