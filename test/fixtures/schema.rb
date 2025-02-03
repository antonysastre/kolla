create_table "action_text_rich_texts", force: :cascade do |t|
  t.string "name", null: false
  t.text "body"
end

create_table "active_storage_attachments", force: :cascade do |t|
  t.string "name", null: false
  t.string "record_type", null: false
  t.bigint "record_id", null: false
  t.bigint "blob_id", null: false
end

create_table "users" do |t|
  t.string "name"
end

create_table "posts" do |t|
  t.string "title"
end
