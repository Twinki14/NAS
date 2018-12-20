## What it does
* NXT and Simba Client Pairing
* Send Fake Input to the NXT client with or without focus
* Allows you to use your Host PC while botting
* Works with SRL-6
* Drawing [(Using LibLayer)](https://github.com/Olly-/libLayer/tree/1.2)


## What it doesn't do
* Filter Bot/User Input
* Work on Non-Windows' systems

## Why?
Something similar to SMART but for the NXT Client was needed.

## How it works
NAS uses the Win32 API to do everything it does. It uses PostMessage to send fake input to the 'Paired' NXT Game Client. 
Currently NAS disables the ability to minimize the paired NXT client at all, but still allows you to use your Host PC and bot without issues. 
The NXT Game Window will continue to run in the background, though you may not be able to minimize it, you can still focus on other programs like games, your browser, or whatever it may be, and use those programs without interfering with the client.

## The Include

* NAS_INI: Uses the NXT Client Process ID, Simba Process ID, and Simba Thread ID to keep track of paired clients
* NAS_Pair: The Structure of a Paired Client
* NAS_Keyboard: Keyboard related functions
* NAS_Mouse: Mouse related functions
* NAS Debug: Each structure has debug methods, you can enable debug by using ```NAS.EnableDebug()``` or ```NAS.DisableDebug()```, you can disable debug to each individual structure


## Simba Input Function Overrides
NAS overrides almost all of Simba's mouse/keyboard functions, like KeyDown, KeyUp, MoveMouse, all of which can be found in Mouse/Keyboard Overrides.pas This is to maintain compatibility between includes.

## Requires [Simba 1.3+ - Simba.i386-win32.exe](https://github.com/MerlijnWajer/Simba/releases)


## Setup
NAS uses the official NXT Client, so just boot NXT up and start the script. 

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
NAS uses [LibLayer](https://github.com/Olly-/libLayer/tree/1.2) to draw on the paired NXT Game Window.
LibLayer now comes with NAS, just use the example below to use it.
```pascal
program new;
{$DEFINE NAS_DRAWING}
{$I NAS\NAS.simba}


begin
  ClearDebug();
  NAS.EnableDebug();

  if(NAS.init()) then
  begin
    NAS.Layer.PaintInterval(100); 
    // Layer supports auto-painting, or you can manually tell it to paint with NAS.Layer.Paint();
    NAS.Drawing.DrawText('Clarity is bae', 'SmallChars07', Point(100, 100), false, 255);
  end;

  repeat
  until false;
end.  
```
