describe Fastlane::Actions::QiyeWechatBotAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("企业微信Bot开始干活啦!")

      Fastlane::Actions::QiyeWechatBotAction.run(key: "YOUR KEY", text:"Kappa构建成功", at_all: true)
    end
  end
end
