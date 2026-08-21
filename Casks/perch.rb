cask "perch" do
  version "1.4.0"
  sha256 "a11980a4f526f591412dfb6001333140971baa8a0e51e0355b24e82a03f71d94"

  url "https://github.com/ishanmalu/perch/releases/download/v#{version}/Perch-#{version}.dmg",
      verified: "github.com/ishanmalu/perch/"
  name "Perch"
  desc "Menu bar utility for window tiling, clipboard history, and system tools"
  homepage "https://github.com/ishanmalu/perch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Perch.app"

  uninstall quit: "com.ishanmalu.perch"

  zap trash: [
    "~/Library/Application Support/Perch",
    "~/Library/Preferences/com.ishanmalu.perch.plist",
    "~/Library/Caches/com.ishanmalu.perch",
  ]

  caveats <<~EOS
    Perch is signed ad-hoc rather than with a paid Apple Developer certificate,
    so macOS quarantines it on first launch. Either install with:

      brew install --cask --no-quarantine perch

    or clear the flag afterwards:

      xattr -dr com.apple.quarantine "#{appdir}/Perch.app"

    Perch also needs Accessibility access for window management, the window
    switcher, and keyboard cleaning:
    System Settings -> Privacy & Security -> Accessibility.
  EOS
end
