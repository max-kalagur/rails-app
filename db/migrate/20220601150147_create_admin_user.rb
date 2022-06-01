class CreateAdminUser < ActiveRecord::Migration[7.0]
  def change
    User.create :email => 'admin@admin.com', password: 123123, role: 1
  end
end
