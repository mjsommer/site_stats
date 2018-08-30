Sequel.migration do
  change do
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:site_visits) do
      primary_key :id
      column :url, "text", :null=>false
      column :referrer, "text"
      column :created_at, "timestamp without time zone", :null=>false
      column :hash, "character(32)", :null=>false
    end
  end
end
Sequel.migration do
  change do
    self << "SET search_path TO \"$user\", public"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20180830181943_create_site_visits.rb')"
  end
end
