# -*- encoding : utf-8 -*-
module PostHelper

  def get_post(id)
    @post = Post.find(id)
    return @post
  end
end
