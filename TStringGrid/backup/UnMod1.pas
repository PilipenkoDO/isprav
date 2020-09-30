unit Unit_resistance;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils;

type Calculation = record
 h,t: real; // исходные данные
end;

Tcalc= array[1..128] of Calculation;

procedure read_params(var h: real; filename: string);
procedure save_params(var h:real; filename: string);
function calc_c(var h,t: real): real;
procedure save_dat(var c:Tcalc; filename: string);

implementation


procedure read_params(var h: Real; filename: string);   //открытие файла с параметрами
var F: text;
begin
  assign(f, filename);
  reset(f);
  readln(f, h);
  close(f);
end;

procedure save_params(var h:real; filename: string); //сохранение параметров
var F: text;
begin
  assign(f, filename);
  rewrite(f);
  writeln(f, h);
  close(f);
 end;

function calc_c(var h,t: real): real;  //функция вычисления сопротивления
begin
  t:=sqrt(2*h/9.81);
  calc_c:=round(t*100)/100;
end;

procedure save_dat(var c:Tcalc; filename: string);//процедура сохранения отчёта
var k:integer;
    s:string;
    F:text;
begin
  k:=1;
  assign(f, filename);
  rewrite(f);
  writeln(f,'отчёт о работе');
  writeln(f,'h:  t:');
  while c[k].h<>0 do
    begin
      s:=(FloatToStr(c[k].h)+'   '+FloatTostr(c[k].t));
      writeln(f);
      writeln(f,s);
      inc(k);
    end;
  writeln(f);
  close(f);
end;

end.

