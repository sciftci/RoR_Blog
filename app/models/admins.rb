# -*- encoding : utf-8 -*-
class Admins < ActiveRecord::Base
  attr_accessible :password, :username, :name, :email, :about, :website, :twitter, :facebook

  require 'digest/md5'

  # before_save :encrypt_password, :on => :save


  # validates_presence_of :username, :password

  validates_presence_of :name, :email, :on => :update

  def encrypt_password
    self.password = Digest::MD5.hexdigest(password)
  end

  def self.validate_admin_login(username,password)

    validates_presence_of :username, :password
    @admin = Admins.find_by_username(username)

    if @admin && @admin.password == Digest::MD5.hexdigest(password)

        @admin

    else

        nil

    end

  end

end
