program Convolve;

{$mode objfpc}

Function f(n : Integer) : Real;
begin
    Result := n*n;
end;

Function g(n : Integer) : Real;
begin
    Result := sin(n);
end;

Function doDirichletConvolution(n : Integer) : Real;
Var 
    sum : Real;
    i   : Integer;
begin
    sum := 0;
    for i := 1 to n do 
    begin
        if (n mod i = 0) then sum := sum + f(i) * g(n div i);
    end;
    Result := sum;
end;

begin
	writeln(doDirichletConvolution(4));
    writeln(doDirichletConvolution(250));
    writeln(doDirichletConvolution(10000));
end.
