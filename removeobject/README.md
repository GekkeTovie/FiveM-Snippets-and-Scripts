# clremoveprops.lua

This script is designed for use with FiveM and removes specific world props (objects) from the GTA V map when a player is nearby. It is intended for use in custom servers where certain map objects need to be dynamically deleted.

## Features

- Removes specified props (by hash and coordinates) from the world.
- Only deletes props when a player is within a certain distance (800 units) to optimize performance.
- Runs automatically after the world loads.

## How It Works

- The script defines a list of props to remove, each with a model hash and coordinates.
- Every 3 seconds, it checks if the player is near any of the listed props.
- If the player is close enough, the script finds and deletes the object.
- Each prop is only removed once per session.

## Usage

1. Place `clremoveprops.lua` in your resource's `client` folder.
2. Add the following to your `__resource.lua` or `fxmanifest.lua`:

    ```lua
    client_script 'client/clremoveprops.lua'
    ```

3. Edit the `propsToRemove` table in the script to add or remove objects as needed. Use [GetHashKey](https://docs.fivem.net/natives/?_0xD24D37CC275948CC) for model hashes and [vector3](https://docs.fivem.net/docs/scripting-reference/vector3/) for coordinates.

## Example

```lua
local propsToRemove = {
    { hash = GetHashKey('prop_fnc_farm_01e'), coords = vector3(-701.8191, 985.1072, 236.9579), removed = false },
    { hash = GetHashKey('prop_fnc_farm_01e'), coords = vector3(-692.5625, 986.9385, 237.1908), removed = false }
}
```

---

