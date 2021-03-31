class BatExtrasBatdiff < Formula
  desc "Diff a file against the current git index, or display the diff between two files"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batdiff.md"
  url "https://github.com/eth-p/bat-extras/archive/v2021.03.30.tar.gz"
  sha256 "0aa0ba879dd30728bf37bf6d7fd12c28d2c3c9709e268d4a90c2096ce08e4534"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "bat"

  depends_on "git-delta" => :recommended

  def install
    system "./build.sh", "batdiff", "--no-verify", "--no-inline", "--minify=all", "--manuals"

    bin.install "bin/batdiff" => "batdiff"
    man1.install "man/batdiff.1"
  end

  def caveats
    <<~EOS
      The following optional packages are installed by default:
       - git-delta (used by batdiff)
    EOS
  end

  test do
    assert_match(/^batdiff\s+\d{4}\.\d{2}\.\d{2}\b/, shell_output("#{bin}/batdiff --version 2>&1").lines.first.chomp)
  end
end
