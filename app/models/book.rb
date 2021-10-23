class Book < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :data

  def to_json arg
    cover_url = rails_blob_url(self.data, disposition: "attachment")

    JSON.parse(super arg).merge(data: cover_url).to_json
  end
end
