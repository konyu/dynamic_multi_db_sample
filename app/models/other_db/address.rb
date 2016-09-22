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

class OtherDb::Address < Address
  establish_connection :other_development
end
