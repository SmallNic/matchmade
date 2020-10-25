class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :pub_date
      t.string :media_url

      t.timestamps
    end
  end
end
