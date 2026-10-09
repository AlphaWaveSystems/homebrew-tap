class Probe < Formula
  desc "E2E testing CLI for Flutter apps using ProbeScript"
  homepage "https://flutterprobe.dev"
  version "0.19.5"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "2ac9ab1812cd46720a0abe2add01cb2e1ebddc74bf56ea7d7fa881411bc33a5d"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "be5638baf830cd9a1f192aeb61857e4712bdc97af326381dea07e67da0afe040"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "c190d8eebbe49168a4c37499869b8523ed8bb9cae1683a93f39e06c7d53084c0"
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
