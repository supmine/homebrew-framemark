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

  # the app is not code-signed, so lift the Gatekeeper quarantine after install
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Framemark.app"],
        writable_paths: ["Framemark.app"],
        writable_base:  :appdir
  end

  zap trash: "~/Library/Preferences/com.sonyexifframe.SonyExifFrame.plist"
end
