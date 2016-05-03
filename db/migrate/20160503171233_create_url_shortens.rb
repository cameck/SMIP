class CreateUrlShortens < ActiveRecord::Migration
  def change
    create_table :url_shortens do |t|
      t.string :original_url
      t.string :small_url

      t.timestamps null: false
    end
  end
end
