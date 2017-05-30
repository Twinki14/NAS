# mNXT 
****The 'Minimizable' Maximizable NXT Client (Name subject to change)****


## What it does
* NXT and Simba Client Pairing
* Send Fake Input to the NXT client with or without focus
* Disables the ability to Minimize the NXT Client
* Allows you to use your Host PC while botting
* Works with SRL-6


## What it doesn't do
* Allow Minimizing the client
* Drawing [(Use LibLayer)](https://github.com/Olly-/libLayer)
* Work on Non-Windows' systems

## Why?
Something similar to SMART but for the NXT Client was needed.

## How it works
mNXT uses the Win32 API to do everything it does. It uses PostMessage to send fake input to the 'paired' NXT Game Client. Currently mNXT disables the ability to minimize the paired NXT client at all, but still allows you to use your Host PC and bot without issues.

## The Include

* mNXT_INI: Uses the NXT Client Process ID, Simba Process ID, and Simba Thread ID to keep track of paired clients
* mNXT_Pair: The Structure of a Paired Client
* mNXT_Keyboard: Keyboard related functions
* mNXT_Mouse: Mouse related functions
* mNXT Debug: Each structure has debug methods, you can enable debug by using mNXT.z_debug;


## Simba Input Function Overrides
mNXT overrides almost all of Simba's mouse/keyboard functions, like KeyDown, KeyUp, MoveMouse, all of which can be find in Mouse/Keyboard Overrides.pas This is to maintain compatibility between includes.

## Requirements
* [Simba 1.20](https://github.com/MerlijnWajer/Simba/releases)
* [Windows-API Include for Simba 1.20](https://github.com/WarPie/Simba-Windows-API)



## Setup
### The NXT Client must be set to 'Compatibility Mode'! The client will lag until it fully loads the shaders
```pascal
program new;
{$I mNXT\mNXT.simba}

begin
  mNXT.z_debug := true;
  mNXT.init();
end.
```
