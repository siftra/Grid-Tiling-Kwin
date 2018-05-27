# Kwin Script That Automatically Tiles Windows

## Install

### Normal Installation

```
plasmapkg2 --type kwinscript -i *path*
mkdir -p ~/.local/share/kservices5
cd ~/.local/share/kservices5
ln -s ../kwin/scripts/grid-tiling/metadata.desktop kwin-script-grid-tiling.desktop 
```

### Local Installation (Advanced)

```
mkdir -p ~/.local/share/kwin/scripts/grid-tiling
cd ~/.local/share/kwin/scripts/grid-tiling
ln -s *path*/contents contents
ln -s *path*/metadata.desktop metadata.desktop
mkdir -p ~/.local/share/kservices5
ln -s ../kwin/scripts/grid-tiling/metadata.desktop kwin-script-grid-tiling.desktop 
```

*Note:* `*path*` *is the path to this repository.*

*Note: You can replace `ln -s` for `cp`, if you prefer to copy and not have it linked to your cloned repository (if you do this then you're pretty much manually doing what `plasmapkg2` does), using `ln` instead of `cp` will result in an automatic update when you pull the latest changes*

### System Installation

*replace `~/.local/share` for `/usr/share` in Local Installation (Advanced) Method*

## Uninstall  

Delete the linked or copied files that you created during installation. To remove installed scripts by `plasmapkg2`, run the same command again but this time with `-r` instead of `-i` to remove (see manual of `plasmapkg2` for more info)

## Preview
![](preview/tiling-gaps.gif)

## Functionality
- automatically tile clients, up to any grid size of clients per (internal) virtual desktop, new clients are first attempted to be added to your current desktop, to the column with the least number of clients.
  - the size of the grid (row & column) is supplied in the UI per screen and separated by a command (first element in row & column are for your first screen and so forth...)
  - you can supply different grid sizes per screen if you have multiple screens
  - if you do not supply a grid size for your additional screen(s) then it will default to the grid size of the first screen
- restriction of minimum space a client can occupy on a virtual desktop, as in the amount of clients this client can share a virtual desktop with
  - the minimum is defined by an **integral number** larger or equal to `1`
  - defaults to the maximum which is the number of rows multiplied by columns
  - a size of `1` is the largest which means that it can only ever exist alone on a virtual desktop, size of `2` means that it can exist with one other client together on a virtual desktop and so forth...
- set margins as defined by `topMargin` `bottomMargin` `leftMargin` `rightMargin`
- set the gap size as defined by `gap`
- set the opacity as defined by `opacity`
- set default opacity toggle `noOpacity`
- set default borders toggle `noBorders`
- toggle between bordered clients (global shortcut: `Grid-Tiling: Switch *Left/Up/Down/Right*`)
- toggle between opaque clients (global shortcut: `Grid-Tiling: Toggle Opacity`)
- switch clients within a virtual desktop both by dragging them outside the `moveThreshold` by mouse and global shortcuts
- move clients between virtual desktops (global shortcut: `Grid-Tiling: Move *Left/Up/Down/Right* Desktop`)
- close all clients on the current virtual desktop (global shortcut: `Grid-Tiling: Close Desktop`)
- dynamically resize clients both by dragging them by mouse and global shortcuts up to a minimum as defined by `dividerBounds`
- maximize client (with gaps) by global shortcut
- add clients to ignored lists (clients, captions) defined by `ignoredClients` and `ignoredCaptions`
- also works for applications which enforce their own geometry on startup (most of the time)

*Note: ignored clients does not have to be an exact match, whereas ignored captions do.*

*Note: internal virtual desktops are defined inside the script and are not the same as the actual virtual desktop. If you fill all your virtual desktops and create a new client than a new layer will be made, which contains a virtual desktop which is different from the one in the layer underneath it.*

## Recommended Setup
- set window focus policy to `focus follows mouse - mouse precedence`
- set shortcuts `Switch One Desktop *Left/Up/Down/Right*` to `Meta+*Left/Up/Down/Right*`
- set shortcuts `Grid-Tiling: Switch *Left/Up/Down/Right*` to `Meta+Alt+*Left/Up/Down/Right*`
- set shortcuts `Grid-Tiling: Move *Left/Up/Down/Right* Desktop` to `Meta+*Home/PgUp/PgDn/End*`
- set shortcut `Grid-Tiling: Toggle Opacity` to `Meta+O`
- set shortcut `Grid-Tiling: Toggle Borders` to `Meta+P`
- set shortcut `Close Window` to `Meta+W`
- set shortcut `Grid-Tiling: Close Desktop` to `Meta+Q`
- set shortcut `Grid-Tiling: Maximize` to `Meta+M`
- set shortcut `Grid-Tiling: Refresh (Minimize)` to `Meta+N`
- set shortcut `Grid-Tiling: Increase Size` to `Meta+=`
- set shortcut `Grid-Tiling: Decrease Size` to `Meta+-`

## Known Issues
- If you have kwin shortcuts added by the script that you no longer need or use (because they got renamed to something else for example), then you can delete the old unused shortcuts by first selecting kwin in the global shortcuts menu and then pressing the `remove the selected component` button (hover mouse over the button to see the text).
- Sometimes when you adjust the settings in the menu, you need to turn the script off, apply it, turn it back on and apply it again to register the new values (or just re-log).
- Some applications do not render correctly on startup sometimes, just use the global shortcut that refreshes the layout
- Maximized clients are not internally remembered so they are brought back to their tiled size when a refresh is called (not just the global shortcut).
- Spotify can sometimes not be defined as full or half client, because both the client name and class of spotify are blank (random)
- Dynamically resizing clients with the mouse can result in weird visual artifacts when dragged outside of the bounds, just use the global shortcut that refreshes the layout.
- I don't use activities, so I don't know how this does with activities.
- I don't use dynamic virtual desktops, no idea what happends. This was made with the intended use of using a set amount of virtual desktops. For the best result make sure you have more virtual desktops than you have clients normally, the script can handle more clients that can fit into all your virtual desktops but it then creates a new layer on top which will make it hard to interact with the clients in the layer underneath.

## Extra Settings Info

### Changing Client Border Size

1. System Settings
2. Application Style
3. Window Decorations
4. **select** `Border size`

### Hiding Client Title Bars

1. System Settings
2. Application Style
3. Window Decorations
4. Your Theme
5. Window Specific Overrides
6. Add
7. **check** `Hide window title bar`
8. `Regular expression to match` = `.*`

## To Do
- make new clips to explain all the different features
- add support for activities (check this commit: ca244ba0dca1d933eb1329d49450603a0f540b65 and do it similarly but with the layer class instead of the desktop class)
- option for active client showing the border
- adding shortcuts that only change the size of clients horizontally or vertically instead of always changing both
- let clients remember their maximization
