class BatExtrasBatwatch < Formula
  desc "Watch for changes in one or more files, and print them with bat"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batwatch.md"
  url "https://github.com/eth-p/bat-extras/archive/v2023.09.19.tar.gz"
  sha256 "8a9b933f5d954c3a89a8435e7a02b4a80e6e16f6a8cb9ff89056cfde3fe67b20"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "bat"

  depends_on "entr" => :recommended

  def install
    system "./build.sh", "batwatch", "--no-verify", "--no-inline", "--minify=all", "--manuals"

    bin.install "bin/batwatch" => "batwatch"
    man1.install "man/batwatch.1"
  end

  test do
    assert_match(/^batwatch\s+\d{4}\.\d{2}\.\d{2}\b/,
      shell_output("#{bin}/batwatch --version 2>&1").lines.first.chomp)
  end
end
