class Rsh < Formula
  desc "Rancher SHell"
  homepage "https://github.com/avvo/rsh"
  url "https://github.com/avvo/rsh/archive/v0.1.1.tar.gz"
  sha256 "010275616b83674c7d883d7fd1f2d6605f05eab555e185669aba6e18ecbeba13"
  head "https://github.com/avvo/rsh.git"

  bottle do
    root_url "https://github.com/avvo/rsh/releases/download/v0.1.1"
    sha256 "013a41fa82988a301cd2165d507f0fb99848fbdc0ae1dc5641a494663b697003" => :el_capitan
    sha256 "68596c1eebcb6b70b3d17a88b6dae4dc81f85e7547f0cbd07b338d4bbce786a8" => :sierra
    sha256 "0830b322eea305a40a88c7ee3c1c3919684fc23aa5893162910f5c3c7b967ab8" => :high_sierra
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
