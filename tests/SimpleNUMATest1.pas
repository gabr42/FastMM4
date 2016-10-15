unit SimpleNUMATest1;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  FastMM4; //AFTER Windows!

procedure RunTheTest;

implementation

procedure RunTheTest;
var
  ga: TGroupAffinity;
  p: pointer;
  p1: array [1..10] of pointer;
  i: Integer;
begin
  FillChar(ga, SizeOf(ga), 0);

  ga.Group := 0;
  ga.Mask := $FFF;
  if SetThreadGroupAffinity(GetCurrentThread, ga, nil) then
    Writeln('OK')
  else
    Writeln(SysErrorMessage(GetLastError));

  GetMem(p, 30000); //medium block
  FreeMem(p);
  GetMem(p, 300000); //large block
  FreeMem(p);

  ga.Group := 1;
  ga.Mask := $FFF;
  if SetThreadGroupAffinity(GetCurrentThread, ga, nil) then
    Writeln('OK')
  else
    Writeln(SysErrorMessage(GetLastError));

  GetMem(p, 30000); //medium block
  FreeMem(p);
  GetMem(p, 300000); //large block
  FreeMem(p);
end;

end.
