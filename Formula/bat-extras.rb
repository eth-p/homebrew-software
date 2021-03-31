class BatExtras < Formula
  desc "Bash scripts that integrate bat with various command-line tools"
  homepage "https://github.com/eth-p/bat-extras"
  url "https://github.com/eth-p/bat-extras/archive/v2021.03.30.tar.gz"
  sha256 "0aa0ba879dd30728bf37bf6d7fd12c28d2c3c9709e268d4a90c2096ce08e4534"
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
