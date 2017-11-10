{$loadlib liblayer.dll}

var
  NAS_LAYER: TLayer;


var
  __SyncInfo: record
    Window: ^TWindowLayer;
    Handle: PtrUInt;
    Thread: PtrUInt;
  end;

  __Layers: array of TLayer;

procedure __AddLayer(Layer: TLayer);
begin
  __Layers += Layer;
end;

procedure __FreeLayers;
var
  i: Int32;
begin
  for i := 0 to High(__Layers) do
    if (__Layers[i].Window <> nil) or (__Layers[i].Bitmap <> nil) then
      __Layers[i].Free();
end;

procedure __SyncLayer;
begin
  __SyncInfo.Window^.Init(__SyncInfo.Handle, __SyncInfo.Thread);
end;

function TLayer.Create(Handle: PtrUInt = GetNativeWindow): TLayer; static;
begin
  __SyncInfo.Window := @Result.Window;
  __SyncInfo.Handle := Handle;
  __SyncInfo.Thread := GetCurrThreadID();

  Sync(@__SyncLayer);

  Result.Bitmap.Init(Client.GetMBitmaps());
  Result.Bitmap.SetPersistentMemory(PtrUInt(Result.Window.Data), Result.Window.Width, Result.Window.Height);

  __AddLayer(Result);
end;

procedure TLayer.Free;
var
  i: Int32;
begin
  if (Self.Window <> nil) then
    Self.Window.Free();
  if (Self.Bitmap <> nil) then
    Self.Bitmap.Free();

  for i := 0 to High(__Layers) do
    if (__Layers[i].Window = Self.Window) or (__Layers[i].Bitmap = Self.Bitmap) then
      __Layers[i] := [nil, nil];
end;

procedure TLayer.Paint;
begin
  Self.Window.Paint();
end;

procedure TLayer.OnClick(Method: TLayerClickEvent);
begin
  Self.Window.OnClick(Method);
end;

procedure TLayer.PaintInterval(Interval: Int32);
begin
  Self.Window.PaintInterval(Interval);
end;

function TLayer.Width: Int32;
begin
  Result := Self.Window.Width;
end;

function TLayer.Height: Int32;
begin
  Result := Self.Window.Height;
end;

begin
  AddOnTerminate('__FreeLayers');
end;
