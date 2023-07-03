# PandaScriptZ BzZz Markers
This script is a utility script for mrs.bzzz's Markers pack. It will allow you to easily create and delete the markers delivered in the pack.

## Features

- Running at 0.00ms at all times
- Spawn markers at specified coordinates
- Customize marker appearance (type, color, light, animation)
- Delete markers based on ID or coordinates
- Automatically update marker visibility based on player distance
- Either use it as library in your own scripts or add markers manually inside the config

## Installation

1. Download the latest release or the repository itself.
2. Move the script into your servers resource folder.
3. Add `start PandaScriptZ-BzZzMarkers` to your `server.cfg` file to ensure the script is started when the server launches.

## Support and Information

If you need any support or have any questions, feel free to join our Discord community. We're here to help!

[![Discord](https://img.shields.io/discord/976202720434327562?color=%237289DA&label=Discord&logo=discord&logoColor=white)](https://discord.gg/ZsZj9gCVWz)

Join our Discord server by clicking on the Discord logo above or by following this link: [https://discord.gg/ZsZj9gCVWz](https://discord.gg/ZsZj9gCVWz)

Our Discord community is a great place to connect with other developers, ask questions, share ideas, and get the latest updates on the script. We look forward to seeing you there!

## Usage

### Spawn a Marker

To spawn a marker at a specific location, use the `PandaScriptZ_Markers:addMarker` event with the following arguments:

```lua
TriggerEvent('PandaScriptZ_Markers:addMarker', coords, type, color, light, anim, range)
```

- `coords`: A table containing the x, y, and z coordinates of the marker. Example: vector3(500,500,500), vector3(Your X, Your Y, Your Z)
- `type`: Marker type (e.g., `ambulance`, `car`, `drink`). More info can be found in your markers documentation
- `color`: Marker color (e.g., `red`, `green`, `blue`).
- `light`: Whether the marker should have a light (options: `true`, `false`).
- `anim`: Whether the marker should have animation (options: `true`, `false`).
- `range`: Marker visibility range in units. The marker will spawn/despawn base on the distance provided to save your performance. 

Example usage:
```lua
local coords = vector3(100,200,50}
TriggerEvent('PandaScriptZ_Markers:addMarker', coords, 'ambulance', 'blue', false, false, 50)
```

Alternatively, you can use the provided export functions to create and delete markers. The export functions also return marker data if needed for future usage.
```lua
local marker = exports['PandaScriptZ-BzZzMarkers']:AddMarker(coords, type, color, light, anim, range)
```

- `coords`: A table containing the x, y, and z coordinates of the marker.
- `type`: Marker type (e.g., `ambulance`, `car`, `drink`).
- `color`: Marker color (e.g., `red`, `green`, `blue`).
- `light`: Whether the marker should have a light (options: `true`, `false`).
- `anim`: Whether the marker should have animation (options: `true`, `false`).
- `range`: Marker visibility range in units.

### Delete a Marker

To delete a marker, use the `PandaScriptZ_Markers:deleteMarker` event with the following arguments:

```lua
TriggerEvent('PandaScriptZ_Markers:deleteMarker', id_or_coords)
```

- `id_or_coords`: Marker ID or coordinates.

Example usage:
```lua
local id_or_coords = 1
TriggerEvent('PandaScriptZ_Markers:deleteMarker', id_or_coords)
```

Export:

```lua
exports['PandaScriptZ-BzZzMarkers']:DeleteMarker(id_or_coords)
```

- `id_or_coords`: Marker ID or coordinates.

Example usage:
```lua
local id_or_coords = 1
exports['PandaScriptZ-BzZzMarkers']:DeleteMarker(id_or_coords)
```

## Command Usages

If enabled in the script configuration, you can use the following commands to interact with markers:

- `/AddMarker [type] [color] [light] [anim] [range]`: Spawn a regular marker at your current location.
- `/DeleteMarker [id_or_coords]`: Delete a marker by ID or coordinates.

Example usages:
- `/AddMarker ambulance red false false 50`
- `/DeleteMarker 1`

## Marker Props

Please refer to the documentation for the available marker types, colors, and variations.
The documentation is included in your copy of mrs.bzzz's Markers pack.
If you don't own it yet, you can get it here: [mrs.bzzz's Markers Pack](https://bzzz.tebex.io/package/5772982)

## Credits

This script was developed by PandaScriptZ and is licensed under the [MIT License](LICENSE).

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.
