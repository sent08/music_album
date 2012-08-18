# To change this template, choose Tools | Templates
# and open the template in the editor.
FactoryGirl.define do


  factory :user do |f|
    f.sequence(:first_name) { |n| "foo#{n}" }
    f.sequence(:last_name) { |n| "last#{n}" }
    f.password "foobar"
    f.password_confirmation { |u| u.password }
    f.sequence(:email) { |n| "foo#{n}@in.com" }
    f.sequence(:display_name) {|n| "some#{n}"}
  end


  factory :album do |f|
    f.association :user
    f.title "Sample Album"
    f.description "My first sample album"
    f.album { fixture_file_upload('/sample.mp3', 'audio/mpeg') }
    f.album_cover { fixture_file_upload('/sample.JPG', 'image/jpeg') }
  end

end

