class Cyberchat < Formula
  desc "AI-powered chat interface for the command line"
  homepage "https://github.com/ramborogers/cyberchat"
  version "0.1.0a"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/cyberchat/releases/download/0.3.0n/cyberchat-darwin-amd64"
      sha256 "fea855f421a632353e6e7e3e4ea304044bea49613b74d45f2621080f046c056b" # amd64
    else
      url "https://github.com/ramborogers/cyberchat/releases/download/0.3.0n/cyberchat-darwin-arm64"
      sha256 "1046a11b9a7420120ce1ca9b0060f10b25028a8b3d3178bd6ebbf6842d34d825" # arm64
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
    system "#{bin}/cyberchat", "--version"
  end
end
