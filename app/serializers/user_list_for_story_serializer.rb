class UserListForStorySerializer < UserListSerializer

  attributes :unwatched_story


  def unwatched_story
    scope[:current_user].unwatched_user?(object)
  end


end
