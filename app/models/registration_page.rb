class RegistrationPage < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader

  beautiful_text_for [:main_text,:text1,:main_text2,:link1,:title1,:text]
end

