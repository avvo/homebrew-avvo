class Avvoenv < Formula
  desc "Fetches the environment variables for Avvo services"
  homepage "https://github.com/avvo/avvoenv"
  url "https://github.com/avvo/avvoenv/archive/v0.2.1.tar.gz"
  sha256 "f1c31bead12e55d89ce7754c0dddbc2d7f83e52a5b167e079f6476ee6276d48c"
  head "https://github.com/avvo/avvoenv.git"

  depends_on "rust" => :build

  def install
    system "rake", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/avvoenv", "-v"
  end
end
