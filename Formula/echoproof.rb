class Echoproof < Formula
  desc "Replay real traffic against base and PR builds and judge behavior changes"
  homepage "https://github.com/est57/echoproof"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/est57/echoproof/releases/download/v0.1.0/echoproof-v0.1.0"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "3ac2188df8a0503f136d58e2910bcb6c4c07be0478b0ba473b748bb249d6ed7b"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "392db82aef08b5414afbf075277349f984b2908aa1f555a62304f96cf288e899"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9403c7008880d599facb58c2a1ab8aa576b4d3d7dae5bb883af030f61cd4f914"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "955d0c7bdb9c2dd02c5dec34ef55fa4314e0ced93f4a11ba7b784523e4adb6b9"
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
