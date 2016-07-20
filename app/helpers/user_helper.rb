module UserHelper
  def default_users
    User.all.where(role: 'default').map { |user| [user.username, user.id] }
  end
end
