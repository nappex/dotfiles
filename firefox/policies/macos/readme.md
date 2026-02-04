The file `firefox.mobileconfig` is 99% copy from project https://github.com/corbindavenport/just-the-browser
Thanks for the work their authors.


# Steps for installation (copied from original project)

## macOS installation

The macOS configuration file applies to all versions of Firefox. This includes Firefox stable, Firefox ESR, Firefox Beta, Firefox Developer Edition, and Firefox Nightly.

- Open the configuration file `firefox.mobileconfig` and save it (Command+S) anywhere on your computer.
- In the Finder, open the configuration file you downloaded. You should see a prompt that the profile is ready for review.
- Open the System Settings application (Apple menu > System Settings) and navigate to General > Device Management. If you are on macOS 12 Monterey or an older version, the application is called System Preferences, and you need to open the Profiles section.
- Double-click on the 'Mozilla Firefox settings' configuration, then click the Install button and follow the prompts.

To remove the custom configuration, open the Device Management settings (or Profiles pane) again, select the 'Mozilla Firefox settings' configuration, and then click the remove (-) button.

If there is no Firefox item in the Device Management settings, you may have the older JSON file installed. You can delete the JSON file by opening your Terminal app (Command+Spacebar and type "terminal") and pasting this command:

```console
sudo rm "/Applications/Firefox.app/Contents/Resources/distribution/policies.json"
```

That command will delete the JSON configuration file used by previous versions of Just The Browser, if the file exists.
