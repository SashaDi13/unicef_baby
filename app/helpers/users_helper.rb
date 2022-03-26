module UsersHelper
  def manager(user)
    managers = []
    while user.parent_id != 0 do
      managers << user
      user = User.find(user.parent_id)
    end
    managers << user
  end
end
