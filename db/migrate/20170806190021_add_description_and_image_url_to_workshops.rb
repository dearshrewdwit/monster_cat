class AddDescriptionAndImageUrlToWorkshops < ActiveRecord::Migration[5.1]
  def change
    add_column :workshops, :description, :string
    add_column :workshops, :image_url, :string
  end
end
