class BatExtras < Formula
  desc "Bash scripts that integrate bat with various command-line tools"
  homepage "https://github.com/eth-p/bat-extras"
  url "https://github.com/eth-p/bat-extras/archive/v2021.04.06.tar.gz"
  sha256 "c34200445239aa2fbdb45b6bd700831d1156dc61e8745e0cce5675726c0b8317"
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
