# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StripeMock < Formula
  desc "stripe-mock is a mock HTTP server that responds like the real Stripe API. It can be used instead of Stripe's testmode to make test suites integrating with Stripe faster and less brittle."
  homepage "https://github.com/stripe/stripe-mock"
  version "0.138.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stripe/stripe-mock/releases/download/v0.138.0/stripe-mock_0.138.0_darwin_arm64.tar.gz"
      sha256 "8da052a09b9266fc30b99c88cf6bdfd2eada223c06ea2aa74930efa361c440c5"

      def install
        bin.install "stripe-mock"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-mock/releases/download/v0.138.0/stripe-mock_0.138.0_darwin_amd64.tar.gz"
      sha256 "b766a8b887b0e721c22700560319ec24b7d69af1d60162d2c6e074559bd63889"

      def install
        bin.install "stripe-mock"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-mock/releases/download/v0.138.0/stripe-mock_0.138.0_linux_amd64.tar.gz"
      sha256 "43df8c4ad7c4e4ed16d0232eedef3ed5a17f9df38ddd9cd63b244acf9e08242c"

      def install
        bin.install "stripe-mock"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/stripe/stripe-mock/releases/download/v0.138.0/stripe-mock_0.138.0_linux_arm64.tar.gz"
      sha256 "7dfe8c5d5ad8153b49a1639f7d7d824f305c49235423908680f1e662adaf0e11"

      def install
        bin.install "stripe-mock"
      end
    end
  end

  plist_options :startup => false

  def plist; <<~EOS
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
      <string>#{opt_bin}/stripe-mock</string>
      <string>-http-port</string>
      <string>12111</string>
      <string>-https-port</string>
      <string>12112</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/stripe-mock.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/stripe-mock.log</string>
  </dict>
</plist>

  EOS
  end
end
