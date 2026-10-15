class Echoproof < Formula
  desc "Replay real traffic against base and PR builds and judge behavior changes"
  homepage "https://github.com/est57/echoproof"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/est57/echoproof/releases/download/v0.4.0/echoproof-v0.4.0"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "77041990a1c4d31b75200c32393122e32b66d063f0a6a39fe76b48a527e8dcc9"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "0dd227c725dbed9db65828f59ee6221e4060301736ef0ed2efa36369f7a60c6d"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c4dc1b11b0cbeeaf56dea3548b3ff8feccf108fe452c86c4a8bb162c73025b5"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4c8692174585f54b3817db7305faab5b7e4965f75ff63298338d283bbda5ab3"
    end
  end

  def install
    bin.install "echoproof"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/echoproof --version")
    system bin/"echoproof", "init"
    assert_path_exists testpath/"echoproof.toml"
  end
end
