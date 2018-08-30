Sequel.migration do
  change do
    create_table :site_visits do
      # text :name

      primary_key :id
      text :url, null: false
      text :referrer
      DateTime :created_at, null: false
      column :hash, "char(32)", null: false
    end
  end
end
