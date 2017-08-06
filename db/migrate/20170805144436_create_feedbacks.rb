class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.belongs_to :workshop, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
