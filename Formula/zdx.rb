class Zdx < Formula
  desc "Terminal AI assistant"
  homepage "https://github.com/tallesborges/zdx"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tallesborges/zdx/releases/download/v0.3.0/zdx-aarch64-apple-darwin.tar.xz"
      sha256 "b0a4394141fe52735004ffbffb069bb782b7b278ac7924cce0ddf5a21e1a5fb9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tallesborges/zdx/releases/download/v0.3.0/zdx-x86_64-apple-darwin.tar.xz"
      sha256 "48abec6a025af1c90a8eb6470e89d28e83ac56fd56ef5c3dd381c27b4168b7ce"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/tallesborges/zdx/releases/download/v0.3.0/zdx-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "34b86da6dc18152966156965a4a80702363f2641d419a1b01726b9be6ce6b283"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "zdx" if OS.mac? && Hardware::CPU.arm?
    bin.install "zdx" if OS.mac? && Hardware::CPU.intel?
    bin.install "zdx" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
