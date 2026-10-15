class Probe < Formula
  desc "E2E testing CLI for Flutter apps using ProbeScript"
  homepage "https://flutterprobe.dev"
  version "0.26.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "bb6711296025b1b0dae0def3ae45e83f8c277bbbd246c0ac629b863b038dc3b8"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "0c77e1d55f4467bdd25b247655bc6c97375fc4da859f8d74234e0b0d2af4469c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "80fa5d390cc4d11e5c877de14ab22407178f43d41639cfab6e53709ad4723463"
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
