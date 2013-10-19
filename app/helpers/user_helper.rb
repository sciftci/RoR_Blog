# -*- encoding : utf-8 -*-
module UserHelper

  def get_username(id)
    @user = Admins.find_by_id(id)
    @user.username
  end

  def username_to_user_id(username)
    @user = Admins.find_by_username(username)
    @user.id
  end

end
