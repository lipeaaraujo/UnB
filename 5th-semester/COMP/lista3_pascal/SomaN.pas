program SomaN(input, output);
var
  n, i, x, soma : LongInt;
begin
  readln(n);
  
  soma := 0;
  i := 0;
  while i < n do
  begin
    readln(x);
    soma := soma + x;
    i := i + 1;
  end;

  writeln(soma);

end.
