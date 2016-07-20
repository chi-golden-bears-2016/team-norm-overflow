class CreateTableQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.integer :author_id, null:false
  		t.string :title, null:false
  		t.text :body, null:false

  		t.timestamps(null:false)
  	end
  end
end
