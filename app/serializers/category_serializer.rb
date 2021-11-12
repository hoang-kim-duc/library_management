class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :image_url

  def image_url
    return "" unless object.image.attached?

    rails_blob_url(object.image, disposition: "attachment")
  end

end
