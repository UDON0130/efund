class User < ActiveRecord::Base
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    # passwordカラムにバリデーションを設定してください
  validates :password, {presence: true}  
end
