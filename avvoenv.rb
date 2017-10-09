class Avvoenv < Formula
  desc "Fetches the environment variables for Avvo services"
  homepage "https://github.com/avvo/avvoenv"
  url "https://github.com/avvo/avvoenv/archive/v0.2.0.tar.gz"
  sha256 "ad32356fd483babae3f5903ff0a43fe666d2f16922ea3b8ad4aa1305c7d74bcb"
  head "https://github.com/avvo/avvoenv.git"

  depends_on "rust" => :build

  def install
    system "rake", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/avvoenv", "-v"
  end
end
