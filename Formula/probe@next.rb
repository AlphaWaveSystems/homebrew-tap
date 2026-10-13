class ProbeATNext < Formula
  desc "E2E testing CLI for Flutter apps using ProbeScript (canary channel)"
  homepage "https://flutterprobe.dev"
  version "0.25.2-next.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "d17eab65d78e0eebd42bfcb31f1ff0e839f74416774f7307e89b512299dd5ebe"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "713220351c04da6e10273a72f5a76e9f1acdd1d7185fa49680a67568a024b5d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "cb2cf3d451092c66494c39e6ab51b213e5114bac0d2964ced03c49d3cf1210cf"
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
