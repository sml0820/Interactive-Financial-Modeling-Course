class FixLinkName < ActiveRecord::Migration
  def change
    rename_column :steps, :link, :video_link
  end
end
