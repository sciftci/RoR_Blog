# -*- encoding : utf-8 -*-
module HomeHelper

  def count_comment(id)
    return Comment.where("content_id='#{id}' and status='1'").count
  end

  def admin_name(id)
    @admin = Admins.find(id)
    return @admin.name
  end

  def down_case(str)
    return str.downcase
  end

  def replace(str)
    return raw str.gsub(/(^|\s)#(\w*[a-zA-Z_]+\w*)/,link_to(" #\\2", "/search/#{"\\2".downcase}"))
  end

end
