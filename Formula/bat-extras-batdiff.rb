class BatExtrasBatdiff < Formula
  desc "Diff a file against the current git index, or display the diff between two files"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batdiff.md"
  url "https://github.com/eth-p/bat-extras/archive/v2023.03.21.tar.gz"
  sha256 "c2469767c7e76f9d9c4a25574a6ed895754e05410f4ba34f534c148e09dca725"
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
