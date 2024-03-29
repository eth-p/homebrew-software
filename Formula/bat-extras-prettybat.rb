class BatExtrasPrettybat < Formula
  desc "Pretty-print source code and highlight it with bat"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/prettybat.md"
  url "https://github.com/eth-p/bat-extras/archive/v2023.09.19.tar.gz"
  sha256 "8a9b933f5d954c3a89a8435e7a02b4a80e6e16f6a8cb9ff89056cfde3fe67b20"
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
