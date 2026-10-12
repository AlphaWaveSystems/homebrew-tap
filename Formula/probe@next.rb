class ProbeATNext < Formula
  desc "E2E testing CLI for Flutter apps using ProbeScript (canary channel)"
  homepage "https://flutterprobe.dev"
  version "0.25.1-next.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "37527a47313cc5676b9d1a4782b1303437232c24ea726cc3398119d0d3b21bea"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "f9f38001ae368fdb18afb399bb584882a04677563bd4e3cc23f3924523b217e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "5343715e3608cbb270c10be5c862daf1f9bbb3f24d4b8c4f72a8b9a8709700f6"
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
