class AddFieldsToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :language_id, :integer
    add_column :themes, :description, :string
    add_column :subthemes, :description, :string
    add_column :subthemes, :video_url, :string
    add_column :subthemes, :theme_id, :string
  end
end
