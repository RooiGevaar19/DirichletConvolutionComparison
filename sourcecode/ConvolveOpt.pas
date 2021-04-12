program Convolve;

{$mode objfpc}{$H+}

uses SysUtils, CThreads, Classes, StopWatch;

type Timer = object
    private
        _beg, _end : LongInt; 
    public
        constructor Create;
        //destructor Destroy;
        function Elapsed : LongInt;
        procedure Reset;
end;

constructor Timer.Create;
begin
    _beg := GetTickCount64 mod High(LongInt);
end;

//destructor Timer.Destroy;
//begin
//    _end := GetTickCount64 mod High(LongInt);
//end;

function Timer.Elapsed : LongInt;
begin
    _end := GetTickCount64 mod High(LongInt);
    Result := _end - _beg;
end;

procedure Timer.Reset;
begin
    _beg := GetTickCount64 mod High(LongInt);
end;



Function f(n : Int64) : Real;
begin
    Result := 1.0 / n;
end;

Function g(n : Int64) : Real;
begin
    Result := sin(n);
end;

Function convolve(n : Int64) : Real;
Var 
    sum : Real;
    i   : Int64;
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

//Function doTest(n : Int64) : Int64;
//Var
//    a : Real;
//    t : Timer;
//begin
//    t.Reset;
//    a := convolve(n);
//    Result := t.Elapsed;
//end;

Function doTest(n : Integer) : Extended;
var
    a : Real;
    t : TStopWatch;
begin
    t := TStopwatch.Create;
    t.Start();
    a := convolve(n);
    t.Stop();
    Result := t.ElapsedTicks / 10000.0;
end;


begin
	write(doTest(StrToInt(ParamStr(1))):2:6);
end.
