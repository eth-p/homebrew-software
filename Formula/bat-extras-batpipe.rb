class BatExtrasBatpipe < Formula
  desc "Less preprocessor for viewing more types of files in the terminal"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batpipe.md"
  url "https://github.com/eth-p/bat-extras/archive/v2023.03.21.tar.gz"
  sha256 "27d6b5849448b7cb76404f549f89def9ea1d5adafca85ad39daf25e9ba6ed907"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "bat"

  def install
    system "./build.sh", "batpipe", "--no-verify", "--no-inline", "--minify=all", "--manuals"

    bin.install "bin/batpipe" => "batpipe"
    man1.install "man/batpipe.1"
  end

  def caveats
    <<~EOS
      Further setup steps are required.
      Run 'batpipe' for more information.
    EOS
  end

  test do
    assert_match(/^batpipe/, shell_output("#{bin}/batpipe 2>&1").lines.first.chomp)
  end
end
