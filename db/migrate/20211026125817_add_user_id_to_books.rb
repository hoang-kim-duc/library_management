class AddUserIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :user, index: true
  end
end
