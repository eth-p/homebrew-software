class BatExtras < Formula
  desc "Bash scripts that integrate bat with various command-line tools"
  homepage "https://github.com/eth-p/bat-extras/blob"
  url "https://github.com/eth-p/bat-extras/archive/v20200408.tar.gz"
  sha256 "3421eb0d5e4590d8745fc78bdd18c9e66724f47f7b4aef34f826fa83469a51cb"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "bat"

  depends_on "entr" # batwatch
  depends_on "prettier" # prettybat
  depends_on "ripgrep" # batgrep
  depends_on "shfmt" # prettybat
  depends_on "clang-format" => :recommended # prettybat

  def install
    system "./build.sh", "--no-verify", "--minify=all"

    bin.install "bin/batgrep" => "batgrep"
    bin.install "bin/batman" => "batman"
    bin.install "bin/batwatch" => "batwatch"
    bin.install "bin/prettybat" => "prettybat"
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

    # batman
    assert_match /^batman\s+\d{4}\.\d{2}\.\d{2}\b/, shell_output("#{bin}/batman --version 2>&1").lines.first.chomp

    # batwatch
    assert_match /^batwatch\s+\d{4}\.\d{2}\.\d{2}\b/, shell_output("#{bin}/batwatch --version 2>&1").lines.first.chomp

    # prettybat
    assert_match /^prettybat\s+\d{4}\.\d{2}\.\d{2}\b/,
      shell_output("#{bin}/prettybat --version 2>&1").lines.first.chomp
  end
end
