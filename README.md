# jnersn/homebrew-tap

Homebrew formulas for my command line tools.

```sh
brew install jnersn/tap/store-previews
brew install jnersn/tap/web-brand-assets
```

To install by short name (`brew install store-previews`), tap and trust this
tap once:

```sh
brew tap jnersn/tap
brew trust jnersn/tap
```

| Formula | Description |
| --- | --- |
| [store-previews](https://github.com/jnersn/store-previews) | Render App Store preview images from screenshots and a JSON config |
| [web-brand-assets](https://github.com/jnersn/web-brand-assets) | Generate favicons, app icons, web manifest and share image from logo files |

Formulas install from the tagged release source. store-previews is compiled,
so it needs Xcode or the Command Line Tools; web-brand-assets is a Python
script and needs Chrome, Chromium or Edge to render. A scheduled workflow updates each formula when its
project publishes a new release.

## License

MIT. See [LICENSE](LICENSE).
