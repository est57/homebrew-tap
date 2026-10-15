class Echoproof < Formula
  desc "Replay real traffic against base and PR builds and judge behavior changes"
  homepage "https://github.com/est57/echoproof"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/est57/echoproof/releases/download/v0.3.0/echoproof-v0.3.0"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "cae1513ea728f58095b3cfe1cbdaf8b11f1b23c7cefcf2c3685e957f3e6548c2"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "28fdae3e17b6078865b8726173e512d8ed869a90922f766c72fe7a9d603651f7"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8e3c7c0b6b21b5cea9bdad29b9093045da584347b034dd5981b1a8d0ae64b12"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdb3efa9db2fc962dcaf58e14f54ec0921e166c1c699ccd33f3c3b45c0d62581"
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
