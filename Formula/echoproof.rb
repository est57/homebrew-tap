class Echoproof < Formula
  desc "Replay real traffic against base and PR builds and judge behavior changes"
  homepage "https://github.com/est57/echoproof"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/est57/echoproof/releases/download/v0.1.1/echoproof-v0.1.1"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "ed8a0f97b30b1306fae22c0372eb90fa9a2413adb304b8703901d0ec9b852f24"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "9519e9dc3d673a12881ea3915f108021215ea8e3529a3d19416dbfd74d9f596d"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82ac6f4e30fa839ac7aa4d0e9784956f6a2d1e0c74ad4aca4754a39a337aeb38"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ef90e6ab04516d868283b4196dd58e6b49286446b472588478b8b59a9813807"
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
