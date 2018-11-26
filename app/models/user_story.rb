class UserStory < ApplicationRecord
  belongs_to :user

  has_many :views, class_name: 'UserStoryView', dependent: :destroy

  has_many :viewers, source: :user, through: :views

  has_attached_file :media

  validates_attachment :media, content_type: {content_type: ['image/png','image/jpeg','image/jpg','image/gif','video/mp4']}
  validates_attachment_presence :media

  def viewed(user)
    view = views.find_or_initialize_by(user_id: user.id)
    view.user =  user
    view.touch if view.persisted?
    if view.save
      update_view_count
    end

  end

  def family_viewers
    viewers.where("user_story_views.user_id IN (
      SELECT `users`.id FROM `users` WHERE (users.id in (
      select followed_id from relationships where follower_id = :user_id and followed_id in (
        select follower_id from relationships where followed_id= :user_id)))

      )", {user_id: user.id})
  end

  def other_viewers
    viewers.where("user_story_views.user_id NOT IN (
      SELECT `users`.id FROM `users` WHERE (users.id in (
      select followed_id from relationships where follower_id = :user_id and followed_id in (
        select follower_id from relationships where followed_id= :user_id)))

      )", {user_id: user.id})
  end


  def viewers_by_group(current_page)
    current_page = current_page.to_i
    f_viewers = family_viewers.page(current_page)
    if f_viewers.count >= 10
      {family: f_viewers, others: []}
    else
      offset = calculate_offset(current_page)
      {family: f_viewers, others: other_viewers.limit(10 - f_viewers.count).offset(offset)}
    end
  end


  def calculate_offset(current_page)
    if current_page <= 1
      0
    else
      f_viewers_count = family_viewers.page(current_page -1 ).count
      f_viewers_count == 10 ? 0 : (10 - f_viewers_count)
    end
  end


  def update_view_count
    update(view_count: views.count)
  end


end
