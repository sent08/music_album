class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :album_file_name
      t.string :album_content_type
      t.string :album_file_size
      t.string :album_cover_file_name
      t.string :album_cover_content_type
      t.string :album_cover_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
