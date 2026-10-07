cask "distroav" do
  version "6.2.1"
  sha256 "2f93e9d7de94f06c5eb36107c7451805ed41b55d32455c0e844215085490e50c"

  url "https://github.com/DistroAV/DistroAV/releases/download/#{version}/distroav-#{version}-macos-universal.pkg"
  name "DistroAV"
  desc "NDI integration for OBS Studio"
  homepage "https://distroav.org/"

  depends_on cask: "libndi"
  depends_on macos: :monterey

  # libndi cask does not manage the versioning yet (Q12026)

  pkg "distroav-#{version}-macos-universal.pkg"

  # The pkg installs the plugin files to /Library/Application Support/obs-studio/plugins
  # however OBS Studio expects them to be in ~/Library/Application Support/obs-studio/plugins
  # so we create symlinks to link the plugin files for OBS Studio.

  # The symlinks are removed again on uninstall (remove_on_uninstall). Only symlinks
  # pointing at the pkg-installed plugin are removed, a manually installed plugin is left alone.
  postflight_steps do
    # Allow update via brew even if the plugin was manually installed.
    remove ["Library/Application Support/obs-studio/plugins/distroav.plugin",
            "Library/Application Support/obs-studio/plugins/distroav.plugin.dSYM"], recursive: true, base: :home
    symlink "/Library/Application Support/obs-studio/plugins/distroav.plugin",
            "Library/Application Support/obs-studio/plugins/distroav.plugin",
            source_base: :absolute, target_base: :home, remove_on_uninstall: true
    symlink "/Library/Application Support/obs-studio/plugins/distroav.plugin.dSYM",
            "Library/Application Support/obs-studio/plugins/distroav.plugin.dSYM",
            source_base: :absolute, target_base: :home, remove_on_uninstall: true
  end

  # Until 6.2.2 the pkg receipt includes literal single quotes in its identifier.
  uninstall pkgutil: [
    "'org.distroav.distroav'",
    "org.distroav.distroav",
  ]

  # No zap stanza required

  caveats <<~EOS
    DistroAV is installed machine-wide by the pkg installer:
      /Library/Application Support/obs-studio/plugins/

    To make the plugin available to OBS Studio, symlinks are created in your
    user OBS plugins directory:
      ~/Library/Application Support/obs-studio/plugins/

    These symlinks are created automatically during installation and removed
    when this cask is uninstalled via brew.
  EOS
end
