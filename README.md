# Naos 
****An NXT AutOing Solution****


## What it does
* NXT and Simba Client Pairing
* Send Fake Input to the NXT client with or without focus
* Allows you to use your Host PC while botting
* Works with SRL-6
* Drawing [(LibLayer)](https://github.com/Olly-/libLayer)


## What it doesn't do
* Filter Bot/User Input
* Work on Non-Windows' systems

## Why?
Something similar to SMART but for the NXT Client was needed.

## How it works
Naos uses the Win32 API to do everything it does. It uses PostMessage to send fake input to the 'Paired' NXT Game Client. 
Currently Naos disables the ability to minimize the paired NXT client at all, but still allows you to use your Host PC and bot without issues. 
The NXT Game Window will continue to run in the background, though you may not be able to minimize it, you can still focus on other programs like games, your browser, or whatever it may be, and use those programs without interfering with the client.

## The Include

* Naos_INI: Uses the NXT Client Process ID, Simba Process ID, and Simba Thread ID to keep track of paired clients
* Naos_Pair: The Structure of a Paired Client
* Naos_Keyboard: Keyboard related functions
* Naos_Mouse: Mouse related functions
* Naos Debug: Each structure has debug methods, you can enable debug by using Naos.EnableDebug()/Naos.DisableDebug(), you can disable debug to each individual structure


## Simba Input Function Overrides
Naos overrides almost all of Simba's mouse/keyboard functions, like KeyDown, KeyUp, MoveMouse, all of which can be found in Mouse/Keyboard Overrides.pas This is to maintain compatibility between includes.

## Requirements
* [Simba 1.20](https://github.com/MerlijnWajer/Simba/releases)
* [Windows-API Include for Simba 1.20](https://github.com/WarPie/Simba-Windows-API)
* [LibLayer (For Drawing)](https://github.com/Olly-/libLayer)



## Setup
### Naos uses the official NXT Client, so just boot NXT up and start the script. 
### The NXT Client must be set to **Compatibility Mode** if you want Color-finding functions to work! It's normal for the client to lag until it fully loads the shaders

```pascal
program new;
{$I Naos\Naos.simba}

begin
  Naos.EnableDebug();
  WriteLn(Naos.init());
end.
```

## Drawing
### Naos uses [LibLayer](https://github.com/Olly-/libLayer) to draw on the paired NXT Game Window.
```pascal
program new;
{$DEFINE NAOS_DRAWING}
{$I Naos\Naos.simba}


begin
  ClearDebug();
  Naos.EnableDebug();

  if(Naos.init()) then
  begin
    Naos.Layer.AutoPaint(100); 
    // Layer supports auto-painting, or you can manually tell it to paint with Naos.Layer.Paint();
    Naos.Drawing.DrawText('Clarity is bae', 'SmallChars07', Point(100, 100), false, 255);
  end;

  repeat
  until false;
end.  
```
