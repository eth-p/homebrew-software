class BatExtras < Formula
  desc "Bash scripts that integrate bat with various command-line tools"
  homepage "https://github.com/eth-p/bat-extras"
  url "https://github.com/eth-p/bat-extras/archive/v2023.09.19.tar.gz"
  sha256 "8a9b933f5d954c3a89a8435e7a02b4a80e6e16f6a8cb9ff89056cfde3fe67b20"
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
