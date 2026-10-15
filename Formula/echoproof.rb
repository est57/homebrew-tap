class Echoproof < Formula
  desc "Replay real traffic against base and PR builds and judge behavior changes"
  homepage "https://github.com/est57/echoproof"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/est57/echoproof/releases/download/v0.2.1/echoproof-v0.2.1"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "4d2b3d6363f4a6ecb38b912264599410e5dbd29c077941498429f76e5badd4ea"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "d14451d81f613bfe32eaf090635d3f0613c8e22ac30723a3bee19b10ae97053b"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa2ea0d506f8c03bb0496d3a34408876af62bce5e1316b09111a334f4760445f"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "555552b3401d5feebb6d843c602d0c17aac90fe7674dbd5f4b182e4b175099f8"
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
