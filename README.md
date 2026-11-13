# RAM Usage — Omarchy bar widget

A tiny bar widget for the [Omarchy](https://omarchy.org) shell that shows how much memory (RAM) is in use, e.g. `RAM 42%`. The value refreshes every 5 seconds.

## Install

```bash
omarchy plugin add https://github.com/ottostern/omarchy-ram-widget --enable
```

Or add it manually to `~/.config/omarchy/shell.json`:

```json
{ "id": "ottostern.ram" }
```

## How it works

Every 5 seconds the widget runs `LC_ALL=C free -m` and computes `used / total`.
`LC_ALL=C` keeps the output in English, so it also works on non-English systems.

## License

MIT
