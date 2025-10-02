class Pokesay < Formula
  desc "Print pokemon in the CLI! An adaptation of the classic 'cowsay'"
  homepage "https://github.com/tmck-code/pokesay"
  license "BSD-3-Clause"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tmck-code/pokesay/releases/download/v0.18.0/pokesay-darwin-amd64"
      sha256 "7686363fbf8b71b7fbf1adce8769c33bbe611627cfbe82417ce17f1e68d5bc6b"
    elsif Hardware::CPU.arm?
      url "https://github.com/tmck-code/pokesay/releases/download/v0.18.0/pokesay-darwin-arm64"
      sha256 "a9bb20705365ddc02ea9d7e5bfc5e8e7123f8e6548f3dd4849fc9e6b7f4242a8"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tmck-code/pokesay/releases/download/v0.18.0/pokesay-linux-amd64"
      sha256 "792acbf1e63f147674b0303a2d007d7dcfa9210210f5c0a52cf12d699d0eb2a7"
    end
  elsif OS.windows?
    url "https://github.com/tmck-code/pokesay/releases/download/v0.18.0/pokesay-windows-amd64.exe"
    sha256 "d1ef69467a0ede044c14a28e30e8e859f9cd81f104faa00de599fc6cc4430d50"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?      then binfile = "pokesay-darwin-amd64"
    elsif OS.mac? && Hardware::CPU.arm?     then binfile = "pokesay-darwin-arm64"
    elsif OS.linux? && Hardware::CPU.intel? then binfile = "pokesay-linux-amd64"
    elsif OS.windows?                       then binfile = "pokesay-windows-amd64.exe"
    end

    bin.install binfile => "pokesay"
  end

  test do
    assert_equal test_fixtures("test.txt"), shell_output("echo w | #{bin}/pokesay -ubjICF -w20 -i 0580.4582")
  end
end
