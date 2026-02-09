class Zdx < Formula
  desc "Terminal AI assistant"
  homepage "https://github.com/tallesborges/zdx"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tallesborges/zdx/releases/download/v#{version}/zdx-aarch64-apple-darwin.tar.gz"
      sha256 "a273419c0032098aceed8b9352f223fb1cdd88189fde9bd851ecf45479b33c99"
    else
      url "https://github.com/tallesborges/zdx/releases/download/v#{version}/zdx-x86_64-apple-darwin.tar.gz"
      sha256 "f754c72a0d7b172c9209ae26080c9ddaa71790776900fd468617a4d6c7c9f762"
    end
  end

  def install
    bin.install "zdx"
  end

  test do
    assert_match "zdx", shell_output("#{bin}/zdx --version")
  end
end
