class AddAuthorToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :author
    add_foreign_key :comments, :users, column: :author_id
  end
end
