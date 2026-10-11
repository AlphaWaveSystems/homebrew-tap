class ProbeATNext < Formula
  desc "E2E testing CLI for Flutter apps using ProbeScript (canary channel)"
  homepage "https://flutterprobe.dev"
  version "0.24.0-next.2"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "4338261f2fe4bda441d6da2eae5ec0738d6b17f477177dca7ba4ff1bddfcd44c"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "89f4fc654ab616d65f10542c2c431985400cdedac203a936114eed733537ac6b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "a5f9c4d998c3f6361f8106cfec94eb254ce46d010548697ad2f1da000694c2a6"
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
