# DistroAV Homebrew Tap

A 🍺[Homebrew](https://brew.sh/) tap for [DistroAV](https://github.com/distroav/distroav).

## Using this tap

In order to install deskflow you must enable this tap

```
brew tap distroav/tap
brew trust distroav/tap
```

You can then install the following Casks

Stable is pinned to the lastest stable release

```
brew install distroav/tap/distroav
```
or

```
brew reinstall distroav/tap/distroav
```


## Why this tap exist ?
DistroAV brew cask has been deprecated on the official homebrew repository
This new way allows you to leverage the ease-of-use of brew for DistroAV without interruption

# Casks
For now there is only one cask `distroav`. but if we keep running into challenge on the long run, we could add some of the dependencies here too.


## What if you already installed DistroAV?
Context: You previously installed DistroAV from the former `brew install distroav` command.

Error message:
`Warning: distroav has been deprecated because it the package is not compatible with Homebrew's installation parameters! It will be disabled on 2026-11-14.`
`Warning: Not upgrading distroav, the latest version is already installed`
Reason: You are likely using the old tap.
Solution: Follow the install step in the section above.

You can force a reinstall with:
```
`brew reinstall --cask distroav/tap/distroav`
```

You should also see the DistroAV tap with `brew tap`.

Until december 2026 it is expected to see multiple distroav Casks with `brew search distroav` the old deprecated and the new managed from DistroAV repo.

<img width="534" height="53" alt="image" src="https://github.com/user-attachments/assets/a8fe536b-cb14-45b8-81ef-7e85fcd23c3c" />



## Contributing

[![Latest Pull Request](https://github.com/distroav/homebrew-tap/workflows/brew%20pr-pull/badge.svg)](https://github.com/distroav/homebrew-tap/actions?query=workflow%3Abrew%20pr-pull)


# homebrew-tap
Install DistroAV easily from Command line on MacOS.

How-to & help
https://docs.brew.sh/Taps
https://casraf.dev/2025/01/distribute-open-source-tools-with-homebrew-taps-a-beginners-guide/

https://docs.brew.sh/Cask-Cookbook

Original (now deprecated: https://formulae.brew.sh/cask/distroav#default

Code: https://github.com/Homebrew/homebrew-cask/blob/444ce69b6efe57566a073d16e62f5ae50994ac9e/Casks/d/distroav.rb

Widely inspired by the code on OBS repo (thanks!)
