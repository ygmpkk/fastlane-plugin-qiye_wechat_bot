describe Fastlane::Actions::QiyeWechatBotAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The qiye_wechat_bot plugin is working!")

      Fastlane::Actions::QiyeWechatBotAction.run(nil)
    end
  end
end
