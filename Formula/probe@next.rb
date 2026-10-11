class ProbeATNext < Formula
  desc "E2E testing CLI for Flutter apps using ProbeScript (canary channel)"
  homepage "https://flutterprobe.dev"
  version "0.24.0-next.4"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "dd5f429c2b2bc598cc82a160ada2f447d5495a6365ada3ff6ae877095c7f5468"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "c67da839f9401d4e387e6299461d74c400abd60751e66fc77f95d4bfcddb8d47"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "e24d2f1066c1362fec491105f5afd83ca6d32382efcc5d17581a9d16fa9de5f8"
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
