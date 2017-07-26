class Stripelocal < Formula
  desc "stripelocal is a server that can be run locally and which responds like the real Stripe API."
  homepage "https://github.com.com/brandur/stripelocal"
  url "https://github.com/brandur/stripelocal/releases/download/v0.1.10/stripelocal_0.1.10_darwin_amd64.tar.gz"
  version "0.1.10"
  sha256 "7d7b9df4b2801187e1eb477d0330c1fd85ef010b8664322d069a52db5ac5427d"

  def install
    bin.install "stripelocal"
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>KeepAlive</key>
    <dict>
      <key>SuccessfulExit</key>
      <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
      <string>#{opt_bin}/stripelocal</string>
      <string>-port</string>
      <string>12111</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/stripelocal.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/stripelocal.log</string>
  </dict>
</plist>

	EOS
  end
end
