class BatExtrasBatgrep < Formula
  desc "Quickly search through and highlight files using ripgrep"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batgrep.md"
  url "https://github.com/eth-p/bat-extras/archive/v2021.04.06.tar.gz"
  sha256 "c34200445239aa2fbdb45b6bd700831d1156dc61e8745e0cce5675726c0b8317"
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
