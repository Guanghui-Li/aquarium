class History < ApplicationRecord
    belongs_to :livestock
    mount_uploader :image, ImageUploader
    validates :event, presence: true
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image'
    }
end
