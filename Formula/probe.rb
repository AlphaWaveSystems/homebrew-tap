class Probe < Formula
  desc "E2E testing CLI for Flutter apps using ProbeScript"
  homepage "https://flutterprobe.dev"
  version "0.23.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-arm64"
      sha256 "0e4819ee5dbe346431a1685d2423b5b005d80862c7143cc3d77fde0f406a35bd"
    end
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-darwin-amd64"
      sha256 "d965d62fc4a142c7f9a3fd902ac542cda1c37c2b12c8f6305e2edbadca05eee6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AlphaWaveSystems/flutter-probe/releases/download/v#{version}/probe-linux-amd64"
      sha256 "967c74352d113f4a4143a713cc10c35d128d98b5d437cc917e3960a76a46fa63"
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
