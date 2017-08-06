class AddBodyToFeedbacks < ActiveRecord::Migration[5.1]
  def change
    add_column :feedbacks, :body, :string
  end
end
