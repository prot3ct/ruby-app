ActiveRecord::Schema.define(version: 20170122154947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "visits", force: :cascade do |t|
    t.integer "user"
    t.integer "count", default: 0
  end

end