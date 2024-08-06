program ConversaoTemperatura(input, output);

var
  escAtual, escConverter : Char;
  temp, tempConv : Double;
begin
  readln(escAtual);
  readln(escConverter);
  readln(temp);

  if escAtual = 'C' then
    if escConverter = 'F' then
      tempConv := (temp * 9/5) + 32
    else
      tempConv := temp + 273.15;

  if escAtual = 'F' then
    if escConverter = 'C' then
      tempConv := (temp - 32) * 5/9
    else
      tempConv := (temp - 32) * 5/9 + 273.15;
  
  if escAtual = 'K' then
    if escConverter = 'F' then
      tempConv := ((temp - 273.15) * 9/5) + 32
    else
      tempConv := temp - 273.15;

  writeln(tempConv:0:2);
end.