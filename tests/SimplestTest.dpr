program SimplestTest;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  FastMM4 in '..\FastMM4.pas';

var
//  p: array [1..10] of pointer;
  i: integer;
  s: string;

begin
  s := '';
  for i := 1 to 4 do
    s := s + '01234567890123456789';

//  for i := 1 to 10 do
//    GetMem(p[i], 30);
//  for i := 1 to 10 do
//    FreeMem(p[i]);
end.
