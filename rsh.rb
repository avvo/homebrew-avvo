class Rsh < Formula
  desc "Rancher SHell"
  homepage "https://github.com/avvo/rsh"
  url "https://github.com/avvo/rsh/archive/v0.1.0.tar.gz"
  sha256 "c71dbbc95d494633a315de14bff9b50e43fe0d2d7fddfee46dbca6e8ed6c3ebd"
  head "https://github.com/avvo/rsh.git"

  bottle do
    root_url "https://github.com/avvo/rsh/releases/download/v0.1.0"
    sha256 "0921a57221275dee993fcaeb9743748eb434799b057b14688397d84a7e6dc826" => :el_capitan
    sha256 "325fbd6cd833a77afa77292613b6a7fcd4b1a7b771991519cae975ad5060a2b7" => :sierra
    sha256 "9d923bc98681f963c8d5677298bf1db17ecaacdf26f919476097d9170d78bafc" => :high_sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/rsh"
    man1.install "rsh.1"
    man5.install "rsh_config.5"
  end

  def caveats
    "See http://infrastructure.corp.avvo.com/projects/rsh/example_config.txt for config examples"
  end

  test do
    system "#{bin}/rsh", "-V"
  end
end
