Windows API for Simba
=====================
It's currently a work in progress. But should be usable even at this state.


Installing
----------
Create a folder in `Includes` named `Windows`, drop the files in there.


Example
-------
```pascal
{$I Windows/Windows.simba}

begin
  User32.SetCursorPos(500,500);
  WriteLn User32.GetCursorPos();
end.
```