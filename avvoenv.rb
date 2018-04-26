class Avvoenv < Formula
  desc "Fetches the environment variables for Avvo services"
  homepage "https://github.com/avvo/avvoenv"
  url "https://github.com/avvo/avvoenv/archive/v0.2.1.tar.gz"
  sha256 "f1c31bead12e55d89ce7754c0dddbc2d7f83e52a5b167e079f6476ee6276d48c"
  head "https://github.com/avvo/avvoenv.git"

  bottle do
    root_url "https://github.com/avvo/avvoenv/releases/download/v0.2.1"
    sha256 "9beea289b3a8b41d1c33b6d9622e2a6ec391a29d6991d0526350e1a96b0f881f" => :el_capitan
    sha256 "e80445e7aabf345feb856a92e66c3b10ab55bd0eb4e154a58d4ab2cf72145c93" => :sierra
    sha256 "b2edfab394dd2eff442d64778f36144386ada7a1a003c61181acecbcbeb232af" => :high_sierra
  end

  depends_on "rust" => :build
  depends_on "ruby" => :build

  def install
    system "rake", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/avvoenv", "-v"
  end
end
