class BatExtras < Formula
  desc "Bash scripts that integrate bat with various command-line tools"
  homepage "https://github.com/eth-p/bat-extras"
  url "https://github.com/eth-p/bat-extras/archive/v20200401.tar.gz"
  sha256 "f6ea5a3c38121e019f5b2738c2a8adeeb8357917d54f7802f1c48b5eb5d05c15"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "entr"

  def install
    system "./build.sh", "--no-verify", "--minify=all"

    bin.install "bin/batgrep" => "batgrep"
    bin.install "bin/batwatch" => "batwatch"
    bin.install "bin/batman" => "batman"
    bin.install "bin/prettybat" => "prettybat"
  end

  test do
    data = test_fixtures("receipt.json")
    output = shell_output("#{bin}/batgrep 'HEAD' #{data} --color=never --context=0")
    assert_match "  \"HEAD\": \"deadbeefdeadbeefdeadbeefdeadbeefdeadbeef\",", output
  end
end
