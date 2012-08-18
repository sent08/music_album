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

end
