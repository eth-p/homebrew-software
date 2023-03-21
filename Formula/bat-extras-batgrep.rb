class BatExtrasBatgrep < Formula
  desc "Quickly search through and highlight files using ripgrep"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batgrep.md"
  url "https://github.com/eth-p/bat-extras/archive/v2023.03.21.tar.gz"
  sha256 "c2469767c7e76f9d9c4a25574a6ed895754e05410f4ba34f534c148e09dca725"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "bat"

  depends_on "ripgrep"

  def install
    system "./build.sh", "batgrep", "--no-verify", "--no-inline", "--minify=all", "--manuals"

    bin.install "bin/batgrep" => "batgrep"
    man1.install "man/batgrep.1"
  end

  test do
    (testpath/"test.txt").write <<~EOS
      abc
      def
      ghi
      cat
      dog
      fox
    EOS

    assert_match(/^batgrep\s+\d{4}\.\d{2}\.\d{2}\b/, shell_output("#{bin}/batgrep --version 2>&1").lines.first.chomp)
    assert_equal ["def\n", "fox\n"], shell_output("#{bin}/batgrep '^f|f$' --context=0 --no-color").lines[1..-2]
  end
end
