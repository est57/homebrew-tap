class Echoproof < Formula
  desc "Replay real traffic against base and PR builds and judge behavior changes"
  homepage "https://github.com/est57/echoproof"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/est57/echoproof/releases/download/v0.2.0/echoproof-v0.2.0"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "dddb2f5dbf28c96117f8042e93d54361790984d923c00fff1df2496aa724016c"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "2130e846cbb878b49f180a76c6b1543bf1cd08e5b5f7b11739078fa4d8428808"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b48fc7f45123bc244531b19dc7fdfc48ede13fb18772ad113af2cd047aa5d4c0"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "650754573df2585a73fa440ef91a86389393c5cd5aef05dc29142aa5bf3b36d1"
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
