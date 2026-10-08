class Probe < Formula
  desc "E2E testing CLI for Flutter apps using ProbeScript"
  homepage "https://flutterprobe.dev"
  version "0.17.2"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "d5ea34a0d63d570c9df15d092a61eea0f5b2090093200115cddc410b03b572fa"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "8453b421ce43645cd306b09b5b1f8c78fba241b23b5dc61d20709a40fe3413f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "22debe8316cd670c5ee5ad94f8e6b138a1a5348fe288856092cc817654daf8f7"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "probe-darwin-arm64" => "probe"
      else
        bin.install "probe-darwin-amd64" => "probe"
      end
    elsif OS.linux?
      bin.install "probe-linux-amd64" => "probe"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/probe version")
  end
end
