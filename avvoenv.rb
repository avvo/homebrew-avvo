class Avvoenv < Formula
  desc "Fetches the environment variables for Avvo services"
  homepage "https://github.com/avvo/avvoenv"
  url "https://github.com/avvo/avvoenv/archive/v0.4.0.tar.gz"
  sha256 "58663d450dea99bcb638e8da04c402595211394fb6f5cc97643c7cd405ce1b31"
  head "https://github.com/avvo/avvoenv.git"

  depends_on "rust" => :build
  depends_on "ruby" => :build

  def install
    system "rake", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/avvoenv", "-v"
  end
end
