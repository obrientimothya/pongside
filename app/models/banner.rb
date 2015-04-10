class Banner < ActiveRecord::Base
  mount_uploader :banner, BannerUploader

  has_many :tables
end
