cask "cyberchat-desktop" do
    version "0.1.0a"

    on_arm do
      url "https://github.com/RamboRogers/cyberchat/releases/download/0.1.0a/CyberChat-0.1.0-a-arm64-mac.zip"
      sha256 "5ad2dfd9106e5f880c212a0f4076590755d23d81e344873910c5664bb7aa1672" # Add the SHA256 of your arm64 zip file
    end

    on_intel do
      url "https://github.com/RamboRogers/cyberchat/releases/download/0.1.0a/CyberChat-0.1.0-a-mac.zip"
      sha256 "5b217324d50c6e7e02baaafb431cf45fc39413d39c80af4eb79340e08250c485" # Add the SHA256 of your intel zip file
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
