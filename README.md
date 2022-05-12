# Redmine GTT Exports Plugin

![CI #develop](https://github.com/gtt-project/redmine_gtt_export/workflows/Test%20with%20Redmine/badge.svg)

This plugin enables project admins to export project member data.

## Requirements

- Redmine >= 4.0.0

## Installation

To install Redmine GTT Export plugin, download or clone this repository in your Redmine installation plugins directory!
```
cd path/to/plugin/directory
git clone https://github.com/gtt-project/redmine_gtt_export.git
```

Then run

```
bundle install
bundle exec rake redmine:plugins:migrate
```

After restarting Redmine, you should be able to see the Redmine GTT Export plugin in the Plugins page.

More information on installing (and uninstalling) Redmine plugins can be found here: https://www.redmine.org/wiki/redmine/Plugins

## How to use

[Settings, screenshots, etc.]

## Contributing and Support

The GTT Project appreciates any [contributions](https://github.com/gtt-project/.github/blob/main/CONTRIBUTING.md)! Feel free to contact us for [reporting problems and support](https://github.com/gtt-project/.github/blob/main/CONTRIBUTING.md).

## Version History

- 2.0.0 Support Redmine 5.0 and drop Redmine <= 3.4 support
- 1.1.0 Publish on GitHub

See [all releases](https://github.com/gtt-project/redmine_gtt_export/releases) with release notes.

## Authors

- [Jens Kraemer](https://github.com/jkraemer)
- [Daniel Kastl](https://github.com/dkastl)
- [Ko Nagase](https://github.com/sanak)
- ... [and others](https://github.com/gtt-project/redmine_gtt_export/graphs/contributors)

## LICENSE

This program is free software. See [LICENSE](LICENSE) for more information.
