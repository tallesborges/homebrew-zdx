cask "zdx" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"
  sha256 arm: "a273419c0032098aceed8b9352f223fb1cdd88189fde9bd851ecf45479b33c99",
         intel: "f754c72a0d7b172c9209ae26080c9ddaa71790776900fd468617a4d6c7c9f762"

  url "https://github.com/tallesborges/zdx/releases/download/v#{version}/zdx-#{arch}-apple-darwin.tar.gz"
  name "zdx"
  desc "Lightweight local terminal coding agent with multi-provider support (Claude, ChatGPT, Gemini) and optional Telegram chat"
  homepage "https://github.com/tallesborges/zdx"

  binary "zdx"
end
