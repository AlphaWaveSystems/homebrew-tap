class Probe < Formula
  desc "E2E testing CLI for Flutter apps using ProbeScript"
  homepage "https://flutterprobe.dev"
  version "0.22.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "eab23aca153fea04c183ac07d8eee0c5700f918db444d5864cf9296fd83734de"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "b3a16c807e34fa1df337875b7d07939380ec4f8599bc44323673029c58a49577"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "2b7d214515d86651cfa4d4bc6c10aff16156cdf56d398e212ca1cdb82848d2ad"
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
