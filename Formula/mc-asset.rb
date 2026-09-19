# v0.1.0 published asset: sha256 below matches the GitHub Release
# tarball `mc-asset-0.1.0.tar.gz` and its `.sha256` companion.
class McAsset < Formula
  desc "Pixel-native Minecraft asset toolchain"
  homepage "https://github.com/smile-minecraft/mc-asset"
  url "https://github.com/smile-minecraft/mc-asset/releases/download/v0.1.0/mc-asset-0.1.0.tar.gz"
  sha256 "bdc941bce9eff148732398bb767d4b73f05c20a6ff4d6718b82a4317dba98881"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "bin", "dist", "LICENSE", "THIRD_PARTY_NOTICES.md"
    bin.write_exec_script libexec/"bin/mc-asset.js"
  end

  test do
    (testpath/"tiny.grid").write <<~EOS
      ; Homebrew formula smoke fixture.
      [palette]
      . = transparent
      S = #ADB7C0FF

      [grid]
      .SS.
      SSSS
      SSSS
      .SS.
    EOS
    system bin/"mc-asset", "render", testpath/"tiny.grid", "--output", testpath/"tiny.png"
    assert_predicate testpath/"tiny.png", :exist?
    system bin/"mc-asset", "analyze", testpath/"tiny.png"
    system bin/"mc-asset", "validate", testpath/"tiny.png"
  end
end
