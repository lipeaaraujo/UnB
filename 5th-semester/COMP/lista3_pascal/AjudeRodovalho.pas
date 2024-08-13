program AjudeRodovalho(input, output);
var
  c1, c2, c3, soma, somaD : Integer;
begin
  readln(c1, c2, c3);
  soma := c1 + c2 + c3;
  readln(somaD);
  
  if somaD = soma then
    writeln('Acertou')
  else
    writeln('Errou');
end.