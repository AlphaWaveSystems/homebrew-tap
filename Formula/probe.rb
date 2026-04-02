class Probe < Formula
  desc "E2E testing CLI for Flutter apps — run ProbeScript tests on simulators and physical devices"
  homepage "https://flutterprobe.dev"
  version "0.5.5"
  license "BSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "3337a3b6ad2058090143d87759e874b34795873e97a3c628059507eb99d749ce"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "31f67f8873106176b8854538113f2da5f1aef7d561ec7d66734e5ccb6cb3a710"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "6ae146718deffe372b51626d380221f9f5680ea898ac1756a050549bcd18e380"
    end
  end

  def install
    on_macos do
      on_arm { bin.install "probe-darwin-arm64" => "probe" }
      on_intel { bin.install "probe-darwin-amd64" => "probe" }
    end
    on_linux do
      on_intel { bin.install "probe-linux-amd64" => "probe" }
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/probe --version")
  end
end
