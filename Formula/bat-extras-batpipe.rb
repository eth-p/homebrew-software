class BatExtrasBatpipe < Formula
  desc "Less preprocessor for viewing more types of files in the terminal"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batpipe.md"
  url "https://github.com/eth-p/bat-extras/archive/v2023.03.21.tar.gz"
  sha256 "c2469767c7e76f9d9c4a25574a6ed895754e05410f4ba34f534c148e09dca725"
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
