class Album < ActiveRecord::Base
  belongs_to :user

  has_attached_file :album_cover,
    :path => ":rails_root/public/album_covers/:id/:styles.:extension",
    :url => "/album_covers/:id/:style/:basename.:extension",
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>",
      :origial => "300X300"
    }
  has_attached_file :album,
    :path => ":rails_root/public/albums/:id/:styles.:extension",
    :url => "/albums/:id/:style/:basename.:extension"
  validates_attachment_presence :album
  validates_attachment_content_type :album, :content_type => ['audio/ogg', 'audio/mp3', 'audio/mpeg']
  validates_attachment_content_type :album_cover, :content_type => ['image/jpeg','image/png','image/gif','image/jpg','image/pjpeg']
#  validates_attachment_size :album_cover, :in => 1..104857600
  validates :title, :presence => true
  validates :user, :presence => true
end
