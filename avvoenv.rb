class Avvoenv < Formula
  desc "Fetches the environment variables for Avvo services"
  homepage "https://github.com/avvo/avvoenv"
  url "https://github.com/avvo/avvoenv/archive/v0.4.1.tar.gz"
  sha256 "cfa7a373ca507be5d57783c3e55a340dd56e2982f7d2da257d7b1ddd48292302"
  head "https://github.com/avvo/avvoenv.git"

  bottle do
    root_url "https://github.com/avvo/avvoenv/releases/download/v0.4.1"
    sha256 "3c9fcb1844a2b762ba71883deb276713f683681dc0173a2449be0de8cdcd926d" => :el_capitan
    sha256 "95e5fd1d4146a1842f65cdf68160ae9704de5749c367e898ebbaaeb1ea81886d" => :sierra
    sha256 "268b00ce8add2fe0f628a298724e86d2cf5b7ec61b8fb1997e41e10f5cf59990" => :high_sierra
  end

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
