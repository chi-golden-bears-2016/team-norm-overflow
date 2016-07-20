class CreateTableAnswers < ActiveRecord::Migration
  def change
  	create_table :answers do |t|
  		t.integer :question_id, null:false
  		t.integer :author_id, null:false
  		t.text :body

  		t.timestamps(null:false)
  	end
  end
end
