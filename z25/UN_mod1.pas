unit UN_Mod1;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils;

type Calculation = record
 x,y,x1,y1,x2,y2,p,s: real; // исходные данные
end;

Tcalc= array[1..128] of Calculation;

procedure read_params(var x,y,x1,y1,x2,y2: real; filename: string);
procedure save_params(var x,y,x1,y1,x2,y2:real; filename: string);
procedure calc_c(var x,y,x1,y1,x2,y2,p,s: real);
procedure save_dat(var c:Tcalc; var x,y,x1,y1,x2,y2:real; filename: string);

implementation


procedure read_params(var x,y,x1,y1,x2,y2: Real; filename: string);   //открытие файла с параметрами
var F: text;
begin
  assign(f, filename);
  reset(f);
  readln(f, x);
  readln(f, y);
  readln(f, x1);
  readln(f, y1);
  readln(f, x2);
  readln(f, y2);
  close(f);
end;

procedure save_params(var x,y,x1,y1,x2,y2:real; filename: string); //сохранение параметров
var F: text;
begin
  assign(f, filename);
  rewrite(f);
  writeln(f, x);
  writeln(f, y);
  writeln(f, x1);
  writeln(f, y1);
  writeln(f, x2);
  writeln(f, y2);
  close(f);
 end;

procedure calc_c(var x,y,x1,y1,x2,y2,p,s: real);  //функция вычисления периметра и площади
var
    a,b,c:real;
begin
  a:=sqrt(sqr(x-x1)+sqr(y-y1));
  b:=sqrt(sqr(x-x2)+sqr(y-y2));
  c:=sqrt(sqr(x1-x2)+sqr(y1-y2));
  p:=(a+b+c)/2;
  s:=sqrt(p*(p-a)*(p-b)*(p-c));
end;

procedure save_dat(var c:Tcalc; var x,y,x1,y1,x2,y2:real; filename: string);//процедура сохранения отчёта
var k:integer;
    s:string;
    F:text;
begin
  k:=1;
  assign(f, filename);
  rewrite(f);
  writeln(f,'отчёт о работе');
  writeln(f,'x:  ',x,'y:  ',y);
  writeln(f,'x1: ',x1,'y1: ',1);
  writeln(f,'x2: ',x2,'y2: ',y2);

      writeln(f);
      writeln(f,'Периметр треугольника = '+floattostr(round(c[k].p*100)/100));
      writeln(f,'Площадь треугольника = '+floattostr(round(c[k].s*100)/100));

  writeln(f);
  close(f);
end;

end.

