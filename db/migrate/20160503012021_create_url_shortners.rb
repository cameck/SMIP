class CreateUrlShortners < ActiveRecord::Migration
  def change
    create_table :url_shortners do |t|
      t.string :original_url
      t.string :small_url
    end
  end
end
