# Self-Deprecated Homebrew tap

Formulae and casks for Self-Deprecated tools, published automatically by each tool's release.

```sh
brew install self-deprecated/tap/sd
```

| Name | Kind | Tool |
| --- | --- | --- |
| `sd` | formula | [self-deprecated/sd](https://github.com/self-deprecated/sd), a project task dispatcher |

`sd` is built from source with Go when installed. Use the fully qualified name: Homebrew core carries an unrelated `sd` (a find-and-replace tool).

`sd` used to be a cask. If you installed that, switch with:

```sh
brew uninstall --cask sd
brew install self-deprecated/tap/sd
```
