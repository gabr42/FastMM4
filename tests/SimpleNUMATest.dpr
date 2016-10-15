program SimpleNUMATest;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  FastMM4 in '..\FastMM4.pas',
  System.SysUtils,
  SimpleNUMATest1 in 'SimpleNUMATest1.pas';

function GetProcessGroupAffinity(hProcess: THandle; var GroupCount: word; GroupArray: pointer): LongBool; stdcall; external 'kernel32.dll';

var
  ga: array [1..10] of word;
  gc: word;

begin
  gc := 10;
  if GetProcessGroupAffinity($FFFFFFFF, gc, @ga) then
    Writeln(gc, ', ', ga[1]);

  try
    RunTheTest;

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
