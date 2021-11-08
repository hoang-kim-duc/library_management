class AddCategoryIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :category, index: true
  end
end
