class BatExtrasBatwatch < Formula
  desc "Watch for changes in one or more files, and print them with bat"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batwatch.md"
  url "https://github.com/eth-p/bat-extras/archive/v2023.03.21.tar.gz"
  sha256 "27d6b5849448b7cb76404f549f89def9ea1d5adafca85ad39daf25e9ba6ed907"
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
