class BluefinCli < Formula
  desc "Bluefin's CLI tool"
  homepage "https://github.com/hanthor/bluefin-cli"
  url "https://github.com/hanthor/bluefin-cli/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "5705fbdcd2c284e773b840b49545783053d37ea56d09024f711a171be814b000"
  license "Apache-2.0"
  head "https://github.com/hanthor/bluefin-cli.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/ublue-os/homebrew-experimental-tap/releases/download/bluefin-cli-0.6.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f31a3a3c99a4fed4238a6909f3543e171cb06464c359296f5e70464855313c9e"
    sha256 cellar: :any_skip_relocation, sequoia:       "d3932ee22e5825853c0f313cf59bb6abd9538adfdd7fd3c4db0c7763fffcd63c"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "979931eb541b87d4247aa2b73b35a88223c29cd8bb3655ef36578d60469e0115"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bef34632a86a8fc00eb858abf663ba23c9b3a17c2c06a863ac7a8f41d4a41961"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bluefin-cli --version")
  end
end
