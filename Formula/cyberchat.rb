class Cyberchat < Formula
  desc "CyberChat P2P Chat"
  homepage "https://github.com/ramborogers/cyberchat"
  version "0.1.0a"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/cyberchat/releases/download/0.1.0a/cyberchat-darwin-amd64"
      sha256 "e43b779f02318691661a9e84501510d5a5891a626d9ad6c98a8787c4190a4feb"
    else
      url "https://github.com/ramborogers/cyberchat/releases/download/0.1.0a/cyberchat-darwin-arm64"
      sha256 "775994a5bc976dbf5cc53d9ccf27f05eceb37d9e296370cf61bebd6b501b596d"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "cyberchat-darwin-amd64" => "cyberchat"
    else
      bin.install "cyberchat-darwin-arm64" => "cyberchat"
    end

    # Remove quarantine attribute
    system "xattr", "-d", "com.apple.quarantine", "#{bin}/cyberchat"
  rescue
    # Ignore if xattr fails (in case attribute doesn't exist)
    nil
  end

  test do
    system "\#{bin}/cyberchat", "--version"
  end
end
