class AddColumnViewsInQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :views, :integer
  end
end
