class Rsh < Formula
  desc "Rancher SHell"
  homepage "https://github.com/avvo/rsh"
  url "https://github.com/avvo/rsh/archive/v0.1.2.tar.gz"
  sha256 "30ff3ca7df486c459999144a69624a2020e890161fa0cc5cb577d13915afb24a"
  head "https://github.com/avvo/rsh.git"

  bottle do
    sha256 "f3fafb22e973e6db2274749c6f7e3203d44913663b3dcbe7f244602052310ba5" => :sierra
    sha256 "0569c83c05297d86acfa5de4fea2400785ffb169d89df1d34cc6fecdd98a33e5" => :high_sierra
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
