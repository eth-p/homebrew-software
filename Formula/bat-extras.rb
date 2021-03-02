class BatExtras < Formula
  desc "Bash scripts that integrate bat with various command-line tools"
  homepage "https://github.com/eth-p/bat-extras"
  url "https://github.com/eth-p/bat-extras/archive/v2020.10.05.tar.gz"
  sha256 "4555e9d809fbc0773275f211e9940afad157cfb6e49253d752a0b977470780a2"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "bat"

  depends_on "entr" # batwatch
  depends_on "prettier" # prettybat
  depends_on "ripgrep" # batgrep
  depends_on "shfmt" # prettybat
  depends_on "clang-format" => :optional # prettybat

  def install
    system "./build.sh", "--no-verify", "--no-inline", "--minify=all", "--manuals"

    bin.install "bin/batgrep" => "batgrep"
    man1.install "man/batgrep.1"

    bin.install "bin/batman" => "batman"
    man1.install "man/batman.1"

    bin.install "bin/batwatch" => "batwatch"
    man1.install "man/batwatch.1"

    bin.install "bin/batdiff" => "batdiff"
    man1.install "man/batdiff.1"

    bin.install "bin/prettybat" => "prettybat"
    man1.install "man/prettybat.1"
  end

  def caveats
    <<~EOS
      The following packages are not installed by default:
       - clang-format (used by prettybat)
    EOS
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

    # batgrep
    assert_match /^batgrep\s+\d{4}\.\d{2}\.\d{2}\b/, shell_output("#{bin}/batgrep --version 2>&1").lines.first.chomp
    assert_equal ["def\n", "fox\n"], shell_output("#{bin}/batgrep '^f|f$' --context=0 --no-color").lines[1..-2]

    # batdiff
    assert_match /^batdiff\s+\d{4}\.\d{2}\.\d{2}\b/, shell_output("#{bin}/batdiff --version 2>&1").lines.first.chomp

    # batman
    assert_match /^batman\s+\d{4}\.\d{2}\.\d{2}\b/, shell_output("#{bin}/batman --version 2>&1").lines.first.chomp

    # batwatch
    assert_match /^batwatch\s+\d{4}\.\d{2}\.\d{2}\b/, shell_output("#{bin}/batwatch --version 2>&1").lines.first.chomp

    # prettybat
    assert_match /^prettybat\s+\d{4}\.\d{2}\.\d{2}\b/,
      shell_output("#{bin}/prettybat --version 2>&1").lines.first.chomp
  end
end
