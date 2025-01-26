class Cyberchat < Formula
  desc "CyberChat P2P Chat"
  homepage "https://github.com/ramborogers/cyberchat"
  version "0.1.0a"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/cyberchat/releases/download/0.1.0a/cyberchat-darwin-amd64"
      sha256 "57cfaed5f50cba0e46d3349707f494750b9814b90644434e62f70d7e5a72e3a6"
    else
      url "https://github.com/ramborogers/cyberchat/releases/download/0.1.0a/cyberchat-darwin-arm64"
      sha256 "debb7d9cd7fd219faf0f2e5101ff78387372dbe2c3ab196a5bbfeb008941692c"
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
