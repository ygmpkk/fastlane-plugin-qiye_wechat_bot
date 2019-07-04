require 'fastlane/action'
require_relative '../helper/qiye_wechat_bot_helper'

module Fastlane
  module Actions
    class QiyeWechatBotAction < Action
      def self.run(params)
        UI.message("企业微信Bot开始干活了!")
        key = params[:key]
        text = params[:text]
        at_all = params[:at_all] == nil ? "" : "@all"
        curl = %Q{
          curl 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=#{key}' \
             -H 'Content-Type: application/json' \
             -d '{
              "msgtype": "text", 
              "text": {
                  "content": "#{text}",
                  "mentioned_list": ["#{at_all}"],
                }
              }'
          }
          UI.message(url)
          system curl
      end

      def self.description
        "企业微信Bot"
      end

      def self.authors
        ["Timothy"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "企业微信Bot"
      end

      def self.available_options
        [
           FastlaneCore::ConfigItem.new(key: :key,
                                   env_name: "QIYE_WECHAT_KEY",
                                description: "the qiye wechat bot key",
                                   optional: false,
                                       type: String),
           FastlaneCore::ConfigItem.new(key: :text,
                                        env_name: "QIYE_WECHAT_TEXT",
                                     description: "the content text send",
                                        optional: false,
                                            type: String),
           FastlaneCore::ConfigItem.new(key: :at_all,
                                              env_name: "QIYE_WECHAT_AT_ALL",
                                           description: "at all user",
                                              optional: true,
                                                  type: Boolean)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
