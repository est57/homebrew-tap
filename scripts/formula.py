#!/usr/bin/env python3
"""Prints the Echoproof formula for a release: formula.py <tag> <dir with .sha256 files>."""
import re
import sys
from pathlib import Path

TARGETS = {
    ("on_macos", "on_arm"): "aarch64-apple-darwin",
    ("on_macos", "on_intel"): "x86_64-apple-darwin",
    ("on_linux", "on_arm"): "aarch64-unknown-linux-gnu",
    ("on_linux", "on_intel"): "x86_64-unknown-linux-gnu",
}


def checksum(directory: Path, tag: str, target: str) -> str:
    text = (directory / f"echoproof-{tag}-{target}.tar.gz.sha256").read_text().split()[0]
    if not re.fullmatch(r"[0-9a-f]{64}", text):
        sys.exit(f"invalid checksum for {target}")
    return text


def block(directory: Path, tag: str, os_name: str) -> str:
    lines = [f"  {os_name} do"]
    for (os_key, cpu), target in TARGETS.items():
        if os_key == os_name:
            lines += [f"    {cpu} do",
                      f'      url "#{{base}}-{target}.tar.gz"',
                      f'      sha256 "{checksum(directory, tag, target)}"',
                      "    end"]
    return "\n".join(lines + ["  end"])


def main() -> None:
    tag, directory = sys.argv[1], Path(sys.argv[2])
    if not re.fullmatch(r"v\d+\.\d+\.\d+", tag):
        sys.exit(f"unexpected tag {tag}")
    print(f'''class Echoproof < Formula
  desc "Replay real traffic against base and PR builds and judge behavior changes"
  homepage "https://github.com/est57/echoproof"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/est57/echoproof/releases/download/{tag}/echoproof-{tag}"

{block(directory, tag, "on_macos")}

{block(directory, tag, "on_linux")}

  def install
    bin.install "echoproof"
  end

  test do
    assert_match version.to_s, shell_output("#{{bin}}/echoproof --version")
    system bin/"echoproof", "init"
    assert_path_exists testpath/"echoproof.toml"
  end
end''')


if __name__ == "__main__":
    main()
