# Development

## Docker

```shell
docker build \
  -f build/packages/brew/Dockerfile \
  --ssh default \
  --build-arg GITHUB_USER_NAME="$(git config user.name)" \
  --build-arg GITHUB_EMAIL="$(git config user.email)" \
  -t homebrew \
  .
```

```shell
docker run \
  -it \
  -v $PWD:/home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/tmck-code/homebrew-taps \
  homebrew:latest \
  bash
```

## Audit

```shell
HOMEBREW_NO_INSTALL_FROM_API=1 /home/linuxbrew/.linuxbrew/bin/brew audit --formula tmck-code/taps/pokesay -v
```

<details>
<summary>Output</summary>

```
linuxbrew@d7061c74fec2:~/.linuxbrew/Homebrew/Library/Taps/tmck-code/homebrew-taps$ HOMEBREW_NO_INSTALL_FROM_API=1 /home/linuxbrew/.linuxbrew/bin/brew audit --formula tmck-code/taps/pokesay -v
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/bundle/ruby/3.4.0/bin/bundle
Error: tmck-code/taps/pokesay: /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/tmck-code/homebrew-taps/Formula/pokesay.rb:34: syntax error found
  32 |   end
  33 |
> 34 |   test do.
     |          ^ unexpected '.', ignoring it
  35 |     expected_output = <<~EOF
  36 |       ╭──────────────────────╮
```

</details>

## Install

```shell
HOMEBREW_NO_INSTALL_FROM_API=1 /home/linuxbrew/.linuxbrew/bin/brew install Formula/pokesay.rb
```

<details>
<summary>Output</summary>

```
linuxbrew@d7061c74fec2:~/.linuxbrew/Homebrew/Library/Taps/tmck-code/homebrew-taps$ HOMEBREW_NO_INSTALL_FROM_API=1 /home/linuxbrew/.linuxbrew/bin/brew install Formula/pokesay.rb
Error:
  homebrew-core is a shallow clone.
To `brew update`, first run:
  git -C /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core fetch --unshallow
This command may take a few minutes to run due to the large size of the repository.
This restriction has been made on GitHub's request because updating shallow
clones is an extremely expensive operation due to the tree layout and traffic of
Homebrew/homebrew-core and Homebrew/homebrew-cask. We don't do this for you
automatically to avoid repeatedly performing an expensive unshallow operation in
CI systems (which should instead be fixed to not use shallow clones). Sorry for
the inconvenience!
==> Fetching downloads for: pokesay
==> Fetching tmck-code/taps/pokesay
==> Downloading https://github.com/tmck-code/pokesay/releases/download/v0.18.0/pokesay-linux-amd64
Already downloaded: /home/linuxbrew/.cache/Homebrew/downloads/efe835177cc2ef1e43cc1f9fccb5e22eff9743e7e9f62b1fe2e87f8fea2a8324--pokesay-linux-amd64
==> Installing pokesay from tmck-code/taps
🍺  /home/linuxbrew/.linuxbrew/Cellar/pokesay/64: 4 files, 6.8MB, built in 0 seconds
==> Running `brew cleanup pokesay`...
Disable this behaviour by setting `HOMEBREW_NO_INSTALL_CLEANUP=1`.
Hide these hints with `HOMEBREW_NO_ENV_HINTS=1` (see `man brew`).
==> No outdated dependents to upgrade!
```

</details>

## Test

```shell
HOMEBREW_NO_INSTALL_FROM_API=1 /home/linuxbrew/.linuxbrew/bin/brew test tmck-code/taps/pokesay
```

<details>
<summary>Output</summary>

```
linuxbrew@d7061c74fec2:~/.linuxbrew/Homebrew/Library/Taps/tmck-code/homebrew-taps$ HOMEBREW_NO_INSTALL_FROM_API=1 /home/linuxbrew/.linuxbrew/bin/brew test tmck-code/taps/pokesay
==> Testing tmck-code/taps/pokesay
==> echo w | /home/linuxbrew/.linuxbrew/Cellar/pokesay/64/bin/pokesay -ubjICF -w20 -i 0580.4582
Error: tmck-code/taps/pokesay: failed
Warning: Removed Sorbet lines from backtrace!
Rerun with `--verbose` to see the original backtrace
An exception occurred within a child process:
  Minitest::Assertion: --- expected
+++ actual
@@ -1,4 +1,4 @@
-"╭──────────────────────╮.
+"╭──────────────────────╮
 │ w\e[0m                    │
 ╰──────╲───────────────╯
         ╲

/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/bundle/ruby/3.4.0/gems/minitest-5.25.5/lib/minitest/assertions.rb:176:in 'Minitest::Assertions#assert'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/bundle/ruby/3.4.0/gems/minitest-5.25.5/lib/minitest/assertions.rb:216:in 'Minitest::Assertions#assert_equal'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/tmck-code/homebrew-taps/Formula/pokesay.rb:59:in 'block in <class:Pokesay>'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/formula.rb:2907:in 'block (3 levels) in Formula#run_test'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/extend/kernel.rb:303:in 'Kernel#with_env'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/formula.rb:2906:in 'block (2 levels) in Formula#run_test'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/formula.rb:1271:in 'Formula#with_logging'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/formula.rb:2905:in 'block in Formula#run_test'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/mktemp.rb:92:in 'block in Mktemp#run'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/mktemp.rb:92:in 'Dir.chdir'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/mktemp.rb:92:in 'Mktemp#run'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/formula.rb:3238:in 'Formula#mktemp'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/formula.rb:2899:in 'Formula#run_test'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/test.rb:53:in 'block in <main>'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/3.4.5/lib/ruby/3.4.0/timeout.rb:185:in 'block in Timeout.timeout'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/3.4.5/lib/ruby/3.4.0/timeout.rb:38:in 'Timeout::Error.handle_timeout'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/3.4.5/lib/ruby/3.4.0/timeout.rb:194:in 'Timeout.timeout'
/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/test.rb:59:in '<main>'
```

</details>