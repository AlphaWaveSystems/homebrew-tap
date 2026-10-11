class ProbeATNext < Formula
  desc "E2E testing CLI for Flutter apps using ProbeScript (canary channel)"
  homepage "https://flutterprobe.dev"
  version "0.25.0-next.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "570cf8eeec9906b3bb7819b836d1a3022ae3e25d1d62cc0e0fb62625be51c4d6"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "323524081f52e83c0812653174199605c3fe5469e8e1c6e91936a1650a91b2b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "b03084e0eb36d0cf64c299e52f8d4d1c9d061f82326eb141381b0a1d6e1186f5"
    end
  end

  conflicts_with "probe", because: "both install a probe binary"

  def install
    if OS.mac?
      bin.install((Hardware::CPU.arm? ? "probe-darwin-arm64" : "probe-darwin-amd64") => "probe")
    else
      bin.install "probe-linux-amd64" => "probe"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/probe version")
  end
end
