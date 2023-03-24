class BatExtrasPrettybat < Formula
  desc "Pretty-print source code and highlight it with bat"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/prettybat.md"
  url "https://github.com/eth-p/bat-extras/archive/v2023.03.21.tar.gz"
  sha256 "27d6b5849448b7cb76404f549f89def9ea1d5adafca85ad39daf25e9ba6ed907"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "bat"

  depends_on "prettier" => :recommended
  depends_on "shfmt" => :recommended

  depends_on "black" => :optional
  depends_on "clang-format" => :optional

  def install
    system "./build.sh", "prettybat", "--no-verify", "--no-inline", "--minify=all", "--manuals"

    bin.install "bin/prettybat" => "prettybat"
    man1.install "man/prettybat.1"
  end

  def caveats
    <<~EOS
      The following optional packages are not installed by default:
       - clang-format (C, C++, Objective-C)
       - black        (Python)

      The following third-party programs are not installed by this Homebrew formula:
      - rustfmt       (Rust)
    EOS
  end

  test do
    assert_match(/^prettybat\s+\d{4}\.\d{2}\.\d{2}\b/,
      shell_output("#{bin}/prettybat --version 2>&1").lines.first.chomp)
  end
end
