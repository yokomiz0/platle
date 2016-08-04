class Gurunavi
  def self.request(q)
    c = HTTPClient.new
    c.get_content 'http://api.gnavi.co.jp/RestSearchAPI/20150630/', {keyid: "362d36f6a0567bfd1dbcc7ad5029f41a", pref:"PREF13"}
  end
end

