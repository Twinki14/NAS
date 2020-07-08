## What it does
* NXT and Simba Client Pairing
* Send Fake Input to the NXT client with or without focus
* Allows you to use your Host PC while botting
* Works with any include for NXT
* Supports drawing with [WindowOverlay](https://github.com/ollydev/WindowOverlay)


## What it doesn't do
* Filter Bot/User Input

## Why?
Something similar to SMART but for the NXT Client was needed.

## How?
NAS uses the Win32 API to do everything it does. It uses PostMessage to send fake input to the 'Paired' NXT Game Client

Currently NAS disables the ability to minimize the paired NXT client at all, but still allows you to use your Host PC and bot without issues

The NXT Game Window will continue to run in the background, though you may not be able to minimize it, you can still focus on other programs like games, your browser, or whatever it may be, and use those programs without interfering with the client

## The Include

* NAS_INI: Uses the NXT Client Process ID, Simba Process ID, and Simba Thread ID to keep track of paired clients
* NAS_Pair: The Structure of a Paired Client
* NAS_Keyboard: Keyboard related functions
* NAS_Mouse: Mouse related functions
* NAS Debug: Each structure has debug methods, you can enable debug by using ```NAS.EnableDebug()``` or ```NAS.DisableDebug()```, you can disable debug to each individual structure


## Simba Input Function Overrides
NAS overrides almost all of Simba's mouse/keyboard functions, like KeyDown, KeyUp, MoveMouse, all of which can be found in Mouse/Keyboard Overrides.pas This is to maintain compatibility between includes

## Requires [whatever ollys latest simba version is at](https://github.com/ollydev/Simba/releases)
#

## Setup
NAS uses the official NXT Client, so just boot NXT up and start the script

The NXT Client must be set to **Compatibility Mode** if you want Color-finding functions to work! It's normal for the client to lag until it fully loads the shaders

```pascal
program new;
{$I NAS\NAS.simba}

begin
  NAS.EnableDebug();
  WriteLn(NAS.init());
end.
```

## Drawing
You can use Olly's [WindowOverlay](https://github.com/ollydev/WindowOverlay) Simba plugin to draw on external targets, be sure to create the overlay **after** ```NAS.init()```

```pascal
program new;
{$I NAS\NAS.simba}
{$loadlib libwindowoverlay}

var
  Overlay: TWindowOverlay;

begin
  NAS.EnableDebug();
  if (NAS.init()) then
  begin
    // `TargetWindow` not specified. Will use Simba's current target
    Overlay := TWindowOverlay.Create(); // by this point the current Simba target should be the NXT client, set by NAS.init()
    AddOnTerminate(@Overlay.Free);

    // Overlay.Bitmap is a TMufasaBitmap, let's draw a red rectangle.
    Overlay.Bitmap.Rectangle([100, 100, 200, 200], 255);
  end
end.
```