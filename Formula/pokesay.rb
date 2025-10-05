class Pokesay < Formula
  desc "Print pokemon in the CLI! An adaptation of the classic 'cowsay'"
  homepage "https://github.com/tmck-code/pokesay"
  license "BSD-3-Clause"
  url "https://github.com/tmck-code/pokesay/releases/download/v0.18.2/pokesay-0.18.2.tar.gz"
  sha256 "d800b298ef09e6c0a9871eaa1d989a290a81088f383c3be53020cf52632534eb"

  def install
    if OS.mac? && Hardware::CPU.intel?      then binfile = "pokesay-darwin-amd64"
    elsif OS.mac? && Hardware::CPU.arm?     then binfile = "pokesay-darwin-arm64"
    elsif OS.linux? && Hardware::CPU.intel? then binfile = "pokesay-linux-amd64"
    elsif OS.windows?                       then binfile = "pokesay-windows-amd64.exe"
    end

    bin.install binfile => "pokesay"
    bash_completion.install "pokesay-completion.bash" => "pokesay"
    fish_completion.install "pokesay-completion.fish" => "pokesay.fish"
    zsh_completion.install "pokesay-completion.zsh" => "_pokesay"
    prefix.install "usr/share/pokesay/pokesay-names.txt"
    prefix.install "usr/share/pokesay/pokesay-ids.txt"
    man1.install "pokesay.1"

    # Create symlinks in Homebrew's share directory
    link_overwrite "share/pokesay/pokesay-names.txt"
    link_overwrite "share/pokesay/pokesay-ids.txt"
  end

  test do
    expected_output = <<~EOF
      ╭──────────────────────╮
      │ w[0m                    │
      ╰──────╲───────────────╯
              ╲
               ╲
                ╲
                 ╲
                      [38;5;16m[49m▄▄[38;5;245m[48;5;16m▄[38;5;231m[48;5;16m▄[38;5;245m[48;5;16m▄[38;5;16m[49m▄▄[49m         [0m
           [38;5;16m[49m▄[38;5;172m[48;5;16m▄[38;5;214m[48;5;16m▄[38;5;16m[49m▄     ▄[38;5;167m[48;5;16m▄[38;5;131m[48;5;167m  ▄[38;5;231m[48;5;245m▄[38;5;151m[48;5;231m ▄[38;5;77m[48;5;231m▄[38;5;77m[48;5;16m▄[38;5;16m[49m▄       [0m
          [38;5;172m[49m[38;5;172m[48;5;16m [38;5;172m[48;5;172m   [38;5;172m[48;5;214m▄[38;5;214m[48;5;16m▄[38;5;16m[49m▄[38;5;131m[49m   [38;5;131m[48;5;16m [38;5;131m[48;5;167m▄[38;5;77m[48;5;167m [38;5;77m[48;5;131m [38;5;77m[48;5;231m  ▄  ▄[38;5;16m[48;5;16m [38;5;16m[49m       [0m
           [38;5;16m[49m▀[38;5;16m[48;5;172m▄[38;5;238m[48;5;172m   ▄[38;5;238m[48;5;16m▄▄▄[38;5;214m[48;5;16m▄[38;5;238m[48;5;131m▄[38;5;231m[48;5;131m  [38;5;231m[48;5;231m  [38;5;231m[48;5;151m▄[38;5;231m[48;5;77m▄[38;5;131m[48;5;77m▄[38;5;131m[48;5;151m▄[38;5;167m[48;5;238m▄[38;5;167m[48;5;16m▄[38;5;16m[49m▄[38;5;172m[49m     [0m
             [38;5;16m[49m▀[38;5;16m[48;5;172m▄[38;5;172m[48;5;172m  [38;5;172m[48;5;238m▄[38;5;16m[48;5;238m▄[38;5;16m[48;5;214m▄[38;5;131m[48;5;214m▄[38;5;214m[48;5;214m [38;5;214m[48;5;238m▄▄[38;5;172m[48;5;238m▄[38;5;238m[48;5;167m▄▄▄[38;5;16m[48;5;167m   ▄▄[38;5;16m[49m▀    [0m
             [38;5;16m[49m[38;5;16m[48;5;16m [38;5;16m[48;5;172m  ▄[38;5;16m[49m▀▄[38;5;214m[48;5;16m▄[38;5;238m[48;5;214m   [38;5;238m[48;5;16m▄[38;5;16m[48;5;231m▄[38;5;214m[48;5;172m▄[38;5;214m[48;5;214m [38;5;214m[48;5;172m▄[38;5;172m[48;5;238m▄▄[38;5;16m[48;5;16m [38;5;16m[49m       [0m
              [38;5;16m[49m▀[38;5;16m[48;5;172m▄[38;5;131m[48;5;172m▄[38;5;238m[48;5;16m▄[38;5;130m[48;5;214m▄[38;5;172m[48;5;214m   [38;5;172m[48;5;203m  [38;5;172m[48;5;214m   ▄[38;5;238m[48;5;214m▄[38;5;172m[48;5;16m▄[38;5;16m[49m▄       [0m
              [38;5;16m[49m▀[38;5;16m[48;5;131m▄[38;5;130m[48;5;238m [38;5;130m[48;5;214m▄[38;5;238m[48;5;214m  ▄[38;5;214m[48;5;214m [38;5;214m[48;5;238m▄[38;5;238m[48;5;214m▄[38;5;172m[48;5;214m▄[38;5;16m[48;5;172m ▄[38;5;16m[49m▀▀▀        [0m
                [38;5;238m[49m[38;5;238m[48;5;16m [38;5;238m[48;5;214m▄[38;5;214m[48;5;214m   [38;5;214m[48;5;238m▄▄[38;5;16m[48;5;172m  ▄[38;5;16m[49m▀           [0m
                 [38;5;16m[49m▀[38;5;16m[48;5;214m▄ ▄▄[38;5;16m[49m▀▀▀[38;5;238m[49m             [0m
                   [39m[49m[38;5;16m[49m▀                  [0m
                                      [0m
      ╭───────────────────────────────────────────────╮
      │ → Pikachu │ ピカチュウ (pikachuu) │ 0580.4582 │
      ╰───────────────────────────────────────────────╯
    EOF
    assert_equal expected_output.strip, shell_output("echo w | #{bin}/pokesay -ubjICF -w20 -i 0580.4582").strip
  end
end
