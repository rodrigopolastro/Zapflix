ActiveRecord::Schema[7.0].define(version: 2022_08_06_200147) do
  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id", null: false
    t.integer "artist_id", null: false
    t.index ["artist_id"], name: "index_contracts_on_artist_id"
    t.index ["movie_id"], name: "index_contracts_on_movie_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "cover_url"
    t.date "published_at"
    t.text "sinopse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "director_id", null: false
    t.integer "movie_genre_id", null: false
    t.index ["director_id"], name: "index_movies_on_director_id"
    t.index ["movie_genre_id"], name: "index_movies_on_movie_genre_id"
  end

  add_foreign_key "contracts", "artists"
  add_foreign_key "contracts", "movies"
  add_foreign_key "movies", "directors"
  add_foreign_key "movies", "movie_genres"
end
