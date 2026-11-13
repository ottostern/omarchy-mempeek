# MemPeek — Omarchy bar widget

A quick peek at your memory. MemPeek is a tiny bar widget for the [Omarchy](https://omarchy.org) shell that shows how much RAM is in use, e.g. `RAM 42%`. The value refreshes every 5 seconds.

![MemPeek in the Omarchy bar](preview.png)

## Install

```bash
omarchy plugin add https://github.com/ottostern/omarchy-mempeek --enable
```

Or, if the plugin is already installed, add it to the bar manually in `~/.config/omarchy/shell.json`, e.g. in the `right` section:

```json
{ "id": "ottostern.mempeek" }
```

## Remove

```bash
omarchy plugin remove ottostern.mempeek
```

This removes the plugin folder and takes the widget out of the bar. If you added it to `~/.config/omarchy/shell.json` by hand, delete the `{ "id": "ottostern.mempeek" }` entry there as well.

## How it works

Every 5 seconds the widget runs `LC_ALL=C free -m` and computes `used / total`.
`LC_ALL=C` keeps the output in English, so it also works on non-English systems.
It has no other dependencies and does not change any of your configuration.

## License

MIT
