module ChinaSMS
  module Service
    module Chuangshimandao
      extend self

      URL= "http://sdk2.zucp.net:8060/z_mdsmssend.aspx"

      def to(phone, content, options)
        uri = URI.parse(URL)
        response = Net::HTTP.post_form(uri, {
          sn:      options[:username],
          pwd:     options[:password],
          mobile:  phone,
          content: content.encode('GB2312')
        })
      end

    end
  end
end
