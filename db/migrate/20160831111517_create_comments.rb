class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |f|
      f.text :body
      f.references :commentable, polymorphic: true, index:true

      f.timestamps null:false
    end
  end
end
