cask "framemark" do
  version "1.0.3"
  sha256 "c6be2ae2b2eac8970a515c00516de2eeb12d122cbe7bac0b241f19cccaebd25b"

  url "https://github.com/supmine/framemark/releases/download/v#{version}/Framemark-macos-arm64.zip"
  name "Framemark"
  desc "Adds an EXIF caption frame with the SONY logo to photos"
  homepage "https://github.com/supmine/framemark"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Framemark.app"

  zap trash: "~/Library/Preferences/com.sonyexifframe.SonyExifFrame.plist"
end
