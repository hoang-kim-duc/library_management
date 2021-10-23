class Book < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :data

  def to_json arg
    cover_url = rails_blob_path(self.data, disposition: "attachment", only_path: true)

    JSON.parse(super arg).merge(data: cover_url).to_json
  end
end
