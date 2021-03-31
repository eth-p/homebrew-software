class BatExtrasBatpipe < Formula
  desc "Less preprocessor for viewing more types of files in the terminal"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batpipe.md"
  url "https://github.com/eth-p/bat-extras/archive/v2021.03.30.tar.gz"
  sha256 "0aa0ba879dd30728bf37bf6d7fd12c28d2c3c9709e268d4a90c2096ce08e4534"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "bat"

  def install
    system "./build.sh", "batpipe", "--no-verify", "--no-inline", "--minify=all", "--manuals"

    bin.install "bin/batpipe" => "batpipe"
    man1.install "man/batpipe.1"
  end

  def caveats
    <<~EOS
      Further setup steps are required.
      Run 'batpipe' for more information.
    EOS
  end

  test do
    assert_match(/^batpipe/, shell_output("#{bin}/batpipe 2>&1").lines.first.chomp)
  end
end
