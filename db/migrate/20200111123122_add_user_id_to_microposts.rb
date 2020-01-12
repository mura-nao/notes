class AddUserIdToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_reference :microposts, :user, foreign_key: true
  end
end
