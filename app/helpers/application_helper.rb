require 'digest/md5'

module ApplicationHelper
  def gravatar_url email
    hash = gravatar_hash email
    "http://www.gravatar.com/avatar/#{hash}?s=48"
  end

  private

  def gravatar_hash email
    Digest::MD5.hexdigest(email.downcase)
  end
end
