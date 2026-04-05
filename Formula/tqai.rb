class Tqai < Formula
  include Language::Python::Virtualenv

  desc "TurboQuant KV cache compression for local LLM inference"
  homepage "https://github.com/AlphaWaveSystems/tqai"
  url "https://files.pythonhosted.org/packages/d6/29/5b65d9e54cd245587568b6c459a266254ea58b31fb93177913fa5177274d/tqai-0.2.0.tar.gz"
  sha256 "b744b298433f6b6a6fa7325b1f734a5e8ad1bcc6ec817da407e0fc9850cdaf7b"
  version "0.2.0"
  license "MIT"

  depends_on "python@3.12"

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/source/n/numpy/numpy-2.2.4.tar.gz"
    sha256 "9ba03692a45d3eef66559efe1d1096c4b9b75c0986b5dff5530655d2b2f12a5e"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"tqai", "info"
  end
end
