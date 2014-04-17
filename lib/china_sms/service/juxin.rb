# encoding: utf-8
require 'json'
require 'iconv'

module ChinaSMS
  module Service
    module Juxin
      extend self

      URL = "http://api.app2e.com/smsSend.api.php"

      def to(phone, content, options)
        phones = Array(phone).join(',')

        uri = URI.parse(URL)
        uri.query = URI.encode_www_form \
          username: options[:username],
          pwd:      options[:password],
          p:        phones,
          msg:      Iconv.conv('GBK', 'utf-8', content)

        res = Net::HTTP.get uri
        result JSON[res]
      end

      def result(body)
        {
          status: body['status'],
          count:  body['count'],
          list:   body['list']
        }
      end

    end
  end
end
