cask "machelper" do
  version "0.3.1"
  sha256 "2e8d56bdfa7ccc9ac3165036c9cbeabeb252cf5f4313ef0878056d4837203f46"

  url "https://github.com/smile-minecraft/MacHelper/releases/download/v#{version}/MacHelper-#{version}.dmg"
  name "MacHelper"
  desc "Menu bar system monitor, fan control and cleanup utility"
  homepage "https://github.com/smile-minecraft/MacHelper"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "MacHelper.app"
  binary "#{appdir}/MacHelper.app/Contents/MacOS/machelper-cli", target: "machelper"

  uninstall launchctl: [
              "com.machelper.MacHelper.AutoClean",
              "com.machelper.MacHelper.MonitorAgent",
            ],
            quit:      "com.machelper.MacHelper"

  zap trash: [
    "~/Library/Application Support/MacHelper",
    "~/Library/Caches/com.machelper.MacHelper",
    "~/Library/HTTPStorages/com.machelper.MacHelper",
    "~/Library/Logs/MacHelper",
    "~/Library/Preferences/com.machelper.MacHelper.plist",
    "~/Library/Saved Application State/com.machelper.MacHelper.savedState",
  ]
end
