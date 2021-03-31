class BatExtrasBatman < Formula
  desc "Read system manual pages using bat as the manual page formatter"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batman.md"
  url "https://github.com/eth-p/bat-extras/archive/v2021.03.30.tar.gz"
  sha256 "0aa0ba879dd30728bf37bf6d7fd12c28d2c3c9709e268d4a90c2096ce08e4534"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "bat"

  def install
    system "./build.sh", "batman", "--no-verify", "--no-inline", "--minify=all", "--manuals"

    bin.install "bin/batman" => "batman"
    man1.install "man/batman.1"
  end

  test do
    assert_match(/^batman\s+\d{4}\.\d{2}\.\d{2}\b/, shell_output("#{bin}/batman --version 2>&1").lines.first.chomp)
  end
end
