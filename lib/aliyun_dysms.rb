require "aliyun_dysms/version"
require "aliyunsdkcore"

module AliyunDysms
  class Configuration
    attr_accessor :access_key_id, :access_key_secret,
                  :region_id, :api_version,
                  :sign_name

    def initialize
      @access_key_id = ""
      @access_key_secret = ""
      @sign_name = ""
      @region_id = "cn-hangzhou"
      @api_version = "2017-05-25"
    end
  end

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    # TODO: 自动解析手机号判断国内国外短信
    def send; end

    def direct_send(phone_numbers, template_code, template_param, out_id = "")
      @response = client.request(
        action: "SendSms",
        params: {
          "RegionId": configuration.region_id,
          "SignName": configuration.sign_name,
          "PhoneNumbers": phone_numbers,
          "TemplateCode": template_code,
          "TemplateParam": template_param,
          "OutId": out_id,
        },
        opts: { method: "POST" },
      )
    rescue StandardError => e
      { Code: "BadRequest", Message: "Request failed: #<#{e.class}: #{e.message}>" }
    end

    def global_send(phone_numbers, country_code, template_code, template_param, out_id = "")
      @response = client.request(
        action: "SendInterSms",
        params: {
          "RegionId": configuration.region_id,
          "SignName": configuration.sign_name,
          "PhoneNumbers": phone_numbers,
          "countryCode": country_code,
          "TemplateCode": template_code,
          "TemplateParam": template_param,
          "OutId": out_id,
        },
        opts: { method: "POST" },
      )
    rescue StandardError => e
      { Code: "BadRequest", Message: "Request failed: #<#{e.class}: #{e.message}>" }
    end

    def client
      @client ||= RPCClient.new(
        access_key_id: configuration.access_key_id,
        access_key_secret: configuration.access_key_secret,
        api_version: configuration.api_version,
        endpoint: "https://dysmsapi.aliyuncs.com",
      )
    end
  end
end
