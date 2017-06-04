{$loadlib LibLayer.dll}

type
  TSimbaLayer = record
    InternalLayer: TLayer;
    Bitmap: TMufasaBitmap;
end;

var
  NAS_Layer: TSimbaLayer;

procedure TSimbaLayer.Paint;
begin
  NAS_Layer.InternalLayer.Paint();
end;

procedure TSimbaLayer.AutoPaint(Interval: Int32);
begin
  NAS_Layer.InternalLayer.PaintInterval(Interval);
end;

{$IFDECL TSyncMethod}
type
  _TLayerClickEvent = procedure(X, Y: Int32; var Block: Boolean);
  TLayerClickEvent = native(_TLayerClickEvent, FFI_CDECL);

procedure TSimbaLayer.OnClick(Proc: TLayerClickEvent);
begin
  NAS_Layer.InternalLayer.OnClick(Proc);
end;

procedure _InitSimbaLayer;
begin
  NAS_Layer.InternalLayer.Init(Client.GetIOManager().GetImageTarget().GetHandle());
end;
{$ELSE}
type
  TLayerClickEvent = procedure(X, Y: Int32; var Block: Boolean);

procedure TSimbaLayer.OnClick(Proc: TLayerClickEvent);
begin
  NAS_Layer.InternalLayer.OnClick(Natify(@Proc));
end;

procedure _InitSimbaLayer; Native;
begin
  NAS_Layer.InternalLayer.Init(Client.GetIOManager().GetImageTarget().GetHandle());
end;
{$ENDIF}

procedure _FreeSimbaLayer;
begin
  NAS_Layer.InternalLayer.Free();
  NAS_Layer.Bitmap.Free();
end;

procedure _InitTNASLayer();
begin
  {$IFDECL TSyncMethod}
    Sync(@_InitSimbaLayer);
  {$ELSE}
    Sync(_InitSimbaLayer);
  {$ENDIF}

  NAS_Layer.Bitmap.Init(Client.GetMBitmaps());
  NAS_Layer.Bitmap.SetPersistentMemory(PtrUInt(NAS_Layer.InternalLayer.Data), NAS_Layer.InternalLayer.Width, NAS_Layer.InternalLayer.Height);

  AddOnTerminate('_FreeSimbaLayer');
end;
