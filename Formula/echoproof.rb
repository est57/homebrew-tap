class Echoproof < Formula
  desc "Replay real traffic against base and PR builds and judge behavior changes"
  homepage "https://github.com/est57/echoproof"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/est57/echoproof/releases/download/v0.1.2/echoproof-v0.1.2"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "cbeb549cecc75be8868235f5ee2876a1d8492632417fac32bc614d260ddf4a16"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "fae2f81da10544a71048e75c1e83fa78e913a8da2944c7d46cf46f1b2b3a9841"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea3e2dc0e4329e71700ae0efd48f3221842d34b9b53d2f843897e1d0795aa55c"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ff21a732041718fbc7fbd18e9f53f5e899307cdb4f555c9cf3f3bfc61476753"
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
