cask "machelper" do
  version "0.4.0"
  sha256 "160b9849fd6f044515f499846c8db0f4e776bff09f401dbf29d009ea55919343"

  url "https://github.com/smile-minecraft/MacHelper/releases/download/v#{version}/MacHelper-#{version}.dmg"
  name "MacHelper"
  desc "Menu bar system monitor, fan control and cleanup utility"
  homepage "https://github.com/smile-minecraft/MacHelper"

  depends_on arch: :arm64
  depends_on macos: :sonoma

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
