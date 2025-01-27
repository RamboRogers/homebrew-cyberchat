cask "cyberchat-desktop" do
    version "0.1.0a"

    on_arm do
      url "https://github.com/RamboRogers/cyberchat/releases/download/0.1.0a/CyberChat-0.1.0-a-arm64-mac.zip"
      sha256 "3c792d02e8278cd404e40f7c0d7ef6f613cd06808518ec525fbe1fc6fbd2dff0" # Add the SHA256 of your arm64 zip file
    end

    on_intel do
      url "https://github.com/RamboRogers/cyberchat/releases/download/0.1.0a/CyberChat-0.1.0-a-mac.zip"
      sha256 "6224b5b940f04517f1a56fd533c6c9aa316b2c1b0b4af244087eb530fcccf9f5" # Add the SHA256 of your intel zip file
    end

    name "CyberChat"
    desc "CyberChat P2P Chat"
    homepage "https://github.com/ramborogers/cyberchat"

    app "CyberChat.app"

    postflight do
      system_command "/usr/bin/xattr",
                    args: ["-d", "com.apple.quarantine", "#{appdir}/CyberChat.app"],
                    sudo: false
    end

    zap trash: [
      "~/Library/Application Support/CyberChat",
      "~/Library/Preferences/com.cyberchat.app.plist",
      "~/Library/Saved Application State/com.cyberchat.app.savedState"
    ]
  end
