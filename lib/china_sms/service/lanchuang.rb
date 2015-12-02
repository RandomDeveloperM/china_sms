module ChinaSMS
  module Service
    module Lanchuang
      extend self

      URL = "http://222.73.117.158/msg/HttpBatchSendSM"

      def to phone, content, options = {}
        response = Net::HTTP.post_form(URI.parse(URL), {
          account: options[:username],
          pswd: options[:password],
          mobile: phone,
          msg: content
        })
      end

    end
  end
end
