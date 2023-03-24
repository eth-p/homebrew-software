class BatExtras < Formula
  desc "Bash scripts that integrate bat with various command-line tools"
  homepage "https://github.com/eth-p/bat-extras"
  url "https://github.com/eth-p/bat-extras/archive/v2023.03.21.tar.gz"
  sha256 "27d6b5849448b7cb76404f549f89def9ea1d5adafca85ad39daf25e9ba6ed907"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "bat-extras-batgrep" => :recommended
  depends_on "bat-extras-batdiff" => :recommended
  depends_on "bat-extras-batman" => :recommended
  depends_on "bat-extras-batpipe" => :recommended
  depends_on "bat-extras-batwatch" => :recommended
  depends_on "bat-extras-prettybat" => :recommended

  def install
    share.install "LICENSE.md"
  end

  def caveats
    <<~EOS
      The 'bat-extras' formula is an alias for installing all 'bat-extras-*' formulae.
    EOS
  end
end
