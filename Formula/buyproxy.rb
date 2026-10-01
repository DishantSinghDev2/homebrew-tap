class Buyproxy < Formula
  desc "BuyProxy command-line tool: generate residential, mobile, ISP and datacenter proxies"
  homepage "https://www.buyproxy.org"
  # `url` and `sha256` are rewritten by the release workflow in
  # DishantSinghDev2/buyproxy-cli (scripts/update-tap.sh) on every tagged release.
  url "https://registry.npmjs.org/buyproxy-cli/-/buyproxy-cli-1.0.0.tgz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/buyproxy --version")
    assert_match "Usage", shell_output("#{bin}/buyproxy help 2>&1")
  end
end
