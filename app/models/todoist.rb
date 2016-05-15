class Todoist
  class << self
    def access_token(code)
      return if code.nil?
      Excon.post('https://todoist.com/oauth/access_token',
      :body => URI.encode_www_form(client_id: '05785ef32b24472e82f89e25bc018f32', state: '0daef4fc6f3b47289a4b4efe4a945781', code: code),
      :headers => { "Content-Type" => "application/x-www-form-urlencoded" })
    end
  end
end