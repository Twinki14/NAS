{$loadlib ../Includes/Layer/liblayer.dll}

type
  TSimbaLayer = record
    InternalLayer: TLayer;
    Bitmap: TMufasaBitmap;
end;

var
  Naos_Layer: TSimbaLayer;

procedure TSimbaLayer.Paint;
begin
  Naos_Layer.InternalLayer.Paint();
end;

procedure TSimbaLayer.AutoPaint(Interval: Int32);
begin
  Naos_Layer.InternalLayer.PaintInterval(Interval);
end;

{$IFDECL TSyncMethod}
type
  _TLayerClickEvent = procedure(X, Y: Int32; var Block: Boolean);
  TLayerClickEvent = native(_TLayerClickEvent, FFI_CDECL);

procedure TSimbaLayer.OnClick(Proc: TLayerClickEvent);
begin
  Naos_Layer.InternalLayer.OnClick(Proc);
end;

procedure _InitSimbaLayer;
begin
  Naos_Layer.InternalLayer.Init(Client.GetIOManager().GetImageTarget().GetHandle());
end;
{$ELSE}
type
  TLayerClickEvent = procedure(X, Y: Int32; var Block: Boolean);

procedure TSimbaLayer.OnClick(Proc: TLayerClickEvent);
begin
  Naos_Layer.InternalLayer.OnClick(Natify(@Proc));
end;

procedure _InitSimbaLayer; Native;
begin
  Naos_Layer.InternalLayer.Init(Client.GetIOManager().GetImageTarget().GetHandle());
end;
{$ENDIF}

procedure _FreeSimbaLayer;
begin
  Naos_Layer.InternalLayer.Free();
  Naos_Layer.Bitmap.Free();
end;

procedure _InitTNaosLayer();
begin
  {$IFDECL TSyncMethod}
    Sync(@_InitSimbaLayer);
  {$ELSE}
    Sync(_InitSimbaLayer);
  {$ENDIF}

  Naos_Layer.Bitmap.Init(Client.GetMBitmaps());
  Naos_Layer.Bitmap.SetPersistentMemory(PtrUInt(Naos_Layer.InternalLayer.Data), Naos_Layer.InternalLayer.Width, Naos_Layer.InternalLayer.Height);

  AddOnTerminate('_FreeSimbaLayer');
end;
