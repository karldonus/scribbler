class RemoveCommenterColumn < ActiveRecord::Migration
  def change
    remove_column :comments, :commenter, :string
  end
end
