class Gitrouter < Formula
  desc "GitHub multi-account management CLI"
  homepage "https://github.com/nugrazurus/gitrouter"
  version "1.0.0"

  on_macos do
    on_intel do
      url "https://github.com/nugrazurus/gitrouter/releases/download/v#{version}/gitrouter-darwin-amd64"
      sha256 "a91bb6c7adbeec81b10d2eea5431627b0593c8bc9932efe2dd63240304230927"
    end
    on_arm do
      url "https://github.com/nugrazurus/gitrouter/releases/download/v#{version}/gitrouter-darwin-arm64"
      sha256 "771ca832708c046c5df2389310549ae5e6a79d493dfd763a347ae1b0ae6a8cfb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nugrazurus/gitrouter/releases/download/v#{version}/gitrouter-linux-amd64"
      sha256 "e1bec4755cecd51d577285d3a3c15391ba60d9a82764b5872178854717d9ca9b"
    end
    on_arm do
      url "https://github.com/nugrazurus/gitrouter/releases/download/v#{version}/gitrouter-linux-arm64"
      sha256 "2dadaabf2d50f87d89e9a79b01db0610920111127aabd90cfe2ca497659a8704"
    end
  end

  def install
    # Rename binary to match formula name
    if OS.mac? && Hardware::CPU.intel?
      bin.install "gitrouter-darwin-amd64" => "gitrouter"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "gitrouter-darwin-arm64" => "gitrouter"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "gitrouter-linux-amd64" => "gitrouter"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "gitrouter-linux-arm64" => "gitrouter"
    end
  end

  test do
    assert_match "gitrouter version", shell_output("#{bin}/gitrouter --version")
  end
end