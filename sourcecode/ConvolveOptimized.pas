program Convolve;

{$mode objfpc}{$H+}

uses SysUtils, CThreads, Classes;

type Timer = object
    private
        _beg, _end : LongInt; 
    public
        constructor Create;
        destructor Destroy;
        function Elapsed : LongInt;
        procedure Reset;
end;

constructor Timer.Create;
begin
    _beg := GetTickCount mod High(LongInt);
end;

destructor Timer.Destroy;
begin
    _end := GetTickCount mod High(LongInt);
end;

function Timer.Elapsed : LongInt;
begin
    _end := GetTickCount mod High(LongInt);
    Result := _end - _beg;
end;

procedure Timer.Reset;
begin
    _beg := GetTickCount mod High(LongInt);
end;



Function f(n : Integer) : Real;
begin
    Result := 1.0 / n;
end;

Function g(n : Integer) : Real;
begin
    Result := sin(n);
end;

Function convolve(n : Integer) : Real;
Var 
    sum : Real;
    i   : Integer;
begin
    sum := 0;
    i := 1;
    while i*i <= n do 
    begin
        if (n mod i = 0) then
        begin
            sum := sum + f(i) * g(n div i);
            if (i*i <> n) then sum := sum + f(n div i) * g(i);
        end; 
        i := i + 1;
    end;
    Result := sum;
end;

Function doTest(n : Integer) : LongInt;
Var
    a : Real;
    t : Timer;
begin
    t.Reset;
    a := convolve(n);
    Result := t.Elapsed;
end;

//Function doTest2(n : Integer) : Extended;
//var
//  Stopwatch: TStopwatch;
//  Elapsed: TTimeSpan;
//begin
//    Stopwatch := TStopwatch.StartNew;
//    DoSomething;
//    Elapsed := Stopwatch.Elapsed;
//
//end;


begin
	write(doTest(StrToInt(ParamStr(1))));
end.
