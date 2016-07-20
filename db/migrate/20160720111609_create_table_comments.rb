class CreateTableComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.integer :author_id, null:false
  		t.text :body, null:false
  		t.string :commentable_type, null:false
  		t.integer :commentable_id, null:false

  		t.timestamps(null:false)
  	end
  end
end
