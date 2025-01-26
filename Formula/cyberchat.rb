class Cyberchat < Formula
  desc "CyberChat P2P Chat"
  homepage "https://github.com/ramborogers/cyberchat"
  version "0.1.0a"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/cyberchat/releases/download/0.1.0a/cyberchat-darwin-amd64"
      sha256 ""
    else
      url "https://github.com/ramborogers/cyberchat/releases/download/0.1.0a/cyberchat-darwin-arm64"
      sha256 ""
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
