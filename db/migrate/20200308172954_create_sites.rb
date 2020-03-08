class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :title
      t.text :desc
      t.string :button_text
      t.string :site_url
      t.string :img_url_sm
      t.string :img_url_lg

      t.timestamps
    end
  end
end
