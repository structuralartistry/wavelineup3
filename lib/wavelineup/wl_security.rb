class WlSecurity

  def self.friendly_token
    SecureRandom.base64(15).tr('+/=', '-_ ').strip.delete("\n")
  end

  def self.one_way_encrypt(value, salt)
    digest = "#{value}#{salt}"
    20.times { digest = Digest::SHA512.hexdigest(digest) }
    digest
  end

end
