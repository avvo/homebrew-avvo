class Avvoenv < Formula
  desc "Fetches the environment variables for Avvo services"
  homepage "https://github.com/avvo/avvoenv"
  url "https://github.com/avvo/avvoenv/archive/v0.4.1.tar.gz"
  sha256 "cfa7a373ca507be5d57783c3e55a340dd56e2982f7d2da257d7b1ddd48292302"
  head "https://github.com/avvo/avvoenv.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/avvoenv"
    man1.install "avvoenv.1"
  end

  test do
    system "#{bin}/avvoenv", "-v"
  end
end
