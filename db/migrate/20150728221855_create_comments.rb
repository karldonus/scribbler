class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :comment_content
      t.datetime :created_at
      t.datetime :updated_at
      t.references :post, index: true, foreign_key: true
    end
  end
end
