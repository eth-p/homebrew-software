class BatExtras < Formula
  desc "Bash scripts that integrate bat with various command-line tools"
  homepage "https://github.com/eth-p/bat-extras"
  url "https://github.com/eth-p/bat-extras/archive/v2023.03.21.tar.gz"
  sha256 "c2469767c7e76f9d9c4a25574a6ed895754e05410f4ba34f534c148e09dca725"
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
