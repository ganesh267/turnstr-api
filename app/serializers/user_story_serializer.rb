class UserStorySerializer < ActiveModel::Serializer
	attributes :id, :media_url, :content_type, :view_count

  attribute :recent_views, if: :include_details?

  def media_url
    object.media.url
  end

  def content_type
    object.media.content_type
  end

	def include_details?
		scope.present? && scope[:include_details].eql?(true)
	end

  def recent_views
    result = []
    object.views.reorder('updated_at desc').limit(3).each do |view|
      result << {id: view.id, user: UserListSerializer.new(view.user, without_serializer: true)}
    end
    result
  end



end