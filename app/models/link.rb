require 'openssl'
require 'base64'

class Link < ActiveRecord::Base
  attr_accessible :title, :url

  def self.encode(value)
  	Base64.encode64(value.to_s)
  end

  def self.decode(value)
  	Base64.decode64(value.to_s)
  end

end