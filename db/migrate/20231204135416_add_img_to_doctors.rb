class AddImgToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :img, :string, default: 'https://static.vecteezy.com/system/resources/previews/020/911/740/original/user-profile-icon-profile-avatar-user-icon-male-icon-face-icon-profile-icon-free-png.png'
  end
end
