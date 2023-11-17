RSpec.describe AliyunDysms do
  describe "AliyunDysms" do
    before do
      AliyunDysms.configure do |config|
        config.access_key_id = "test_access_key_id"
        config.access_key_secret = "test_access_key_secret"
        config.sign_name = "test_sign_name"
      end
    end

    it "has a version number" do
      expect(AliyunDysms::VERSION).not_to be nil
    end

    it "direct_send" do
      phone_numbers = "mobile_number"
      template_code = "SMS_206548670"
      template_param = { code: "123456" }

      ret = AliyunDysms.direct_send(phone_numbers, template_code, template_param.to_json)
      expect(ret["Code"]).to eql("OK")
    end

    it "global send" do
      phone_numbers = "mobile_number"
      country_code = "US"
      template_code = "SMS_218172786"
      template_param = { code: "123456" }

      ret = AliyunDysms.global_send(phone_numbers, country_code, template_code, template_param.to_json)
      expect(ret["Code"]).to eql("OK")
    end
  end
end
