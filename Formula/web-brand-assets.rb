class WebBrandAssets < Formula
  include Language::Python::Shebang

  desc "Generate favicons, app icons, web manifest and share image from logo files"
  homepage "https://github.com/jnersn/web-brand-assets"
  url "https://github.com/jnersn/web-brand-assets/archive/refs/tags/0.1.0.tar.gz"
  sha256 "4507f206ab4ca1f3008ecd6c265da528189c6e4c9337d8b2f88075ba40b712be"
  license "MIT"
  head "https://github.com/jnersn/web-brand-assets.git", branch: "main"

  depends_on "python@3.15"

  def install
    rewrite_shebang detected_python_shebang, "web-brand-assets"
    bin.install "web-brand-assets"
    pkgshare.install "examples"
  end

  def caveats
    <<~EOS
      Rendering needs Google Chrome, Chromium, Microsoft Edge or chrome-headless-shell.
      It is found on PATH or in /Applications; pass --chrome PATH to pick one.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web-brand-assets --version")

    cp_r pkgshare/"examples/.", testpath
    tags = shell_output("#{bin}/web-brand-assets #{testpath}/web-brand-assets.json --head")
    assert_match '<link rel="manifest" href="/site.webmanifest" />', tags
    assert_match '<meta property="og:image" content="https://example.com/og-image.png" />', tags
  end
end
