class Rsh < Formula
  desc "Rancher SHell"
  homepage "https://github.com/avvo/rsh"
  url "https://github.com/avvo/rsh/archive/v0.1.1.tar.gz"
  sha256 "010275616b83674c7d883d7fd1f2d6605f05eab555e185669aba6e18ecbeba13"
  head "https://github.com/avvo/rsh.git"

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
