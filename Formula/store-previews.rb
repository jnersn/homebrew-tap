class StorePreviews < Formula
  desc "Render App Store preview images from screenshots and a JSON config"
  homepage "https://github.com/jnersn/store-previews"
  url "https://github.com/jnersn/store-previews/archive/refs/tags/0.2.0.tar.gz"
  sha256 "5e812ead314d3912434af6d20ecbacdcd1cc2a22cb365f2fb33a93b20704ba48"
  license "MIT"
  head "https://github.com/jnersn/store-previews.git", branch: "main"

  depends_on macos: :ventura

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/store-previews"
  end

  test do
    assert_match "iphone-6.9", shell_output("#{bin}/store-previews presets")

    (testpath/"screenshots/iphone").mkpath
    cp test_fixtures("test.png"), testpath/"screenshots/iphone/Home.png"
    (testpath/"store-previews.json").write <<~JSON
      {
        "targets": [{ "preset": "iphone-6.9" }],
        "screens": [{ "file": "Home", "title": "Hello" }]
      }
    JSON
    system bin/"store-previews", "render", testpath/"store-previews.json"
    assert_path_exists testpath/"previews/iphone-6.9/01_Home.png"
  end
end
