class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :cover_url
      t.date :published_at
      t.text :sinopse

      t.timestamps
    end
  end
end
