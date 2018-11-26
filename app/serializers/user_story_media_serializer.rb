class UserStoryMediaSerializer < ActiveModel::Serializer
	attributes :id, :media_url, :created_at, :updated_at

  def media_url
    object.media.url
  end

end