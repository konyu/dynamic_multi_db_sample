# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OtherDb::User < User
  establish_connection :other_development
  # has_oneのアソシエーション
  # 同じネームスペース上に(ディレクトリに平たくファイルを置いておけば)
  # anonymous_classやforeign_keyを設定しなくても良い
  has_one :address
end
