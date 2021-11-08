class BookSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :cover_url, :description, :category_id, :data_url, :user_id

  def data_url
    return "" unless object.data.attached?

    rails_blob_url(object.data, disposition: "attachment")
  end

  def cover_url
    return "" unless object.cover.attached?

    rails_blob_url(object.cover, disposition: "attachment")
  end
end
