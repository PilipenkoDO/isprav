unit UN;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  UN_mod1;

type

  { TForm1 }

  TForm1 = class(TForm)    //класс формы
    Button1: TButton;
    kor11: TEdit;
    kor12: TEdit;
    kor21: TEdit;
    kor22: TEdit;
    kor31: TEdit;
    kor32: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MainMenu1: TMainMenu;  //поля класса TForm1
    mfile: TMenuItem;
    spravka: TMenuItem;
    vihod: TMenuItem;
    fopen: TMenuItem;
    fsave: TMenuItem;
    fsaveas: TMenuItem;
    OD1: TOpenDialog;
    SD2: TSaveDialog;
    SD1: TSaveDialog;
    vivod: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);     // объявление методов класса TForm1
    procedure mfileClick(Sender: TObject);
    procedure spravkaClick(Sender: TObject);
    procedure vihodClick(Sender: TObject);
    procedure fopenClick(Sender: TObject);
    procedure fsaveClick(Sender: TObject);
    procedure fsaveasClick(Sender: TObject);
    procedure vivodChange(Sender: TObject);
    procedure DataFromForm();                      //конец списка методов класса
  private

  public

  end;

var
  Form1: TForm1;     //объект класса TForm1
   flag:boolean;
   i:integer;
   c:Tcalc;
   x,y,x1,y1,x2,y2,p,s:real;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DataFromForm(); //определение метода класса.
begin
  if TryStrToFloat(kor11.Text, x) = false or TryStrToFloat(kor11.Text, y) = false
  or TryStrToFloat(kor11.Text, x1) = false or TryStrToFloat(kor11.Text, y1) = false
  or TryStrToFloat(kor11.Text, x2) = false or TryStrToFloat(kor11.Text, y2) = false
  then
    begin
    ShowMessage('Неправильно введён параметр ');
    flag:=false;
    exit;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);          // описание метода.
begin
   DataFromForm();
    if flag=true then
      begin
          vivod.lines.clear;
          x:=strtofloat(kor11.text);
          y:=strtofloat(kor12.text);
          x1:=strtofloat(kor21.text);
          y1:=strtofloat(kor22.text);
          x2:=strtofloat(kor31.text);
          y2:=strtofloat(kor32.text);
          calc_c(x,y,x1,y1,x2,y2,p,s);
          vivod.lines.add ('Периметр треугольника = '+floattostr(round(p*100)/100));
          vivod.lines.add ('Площадь треугольника = '+floattostr(round(s*100)/100));
      end
else
   begin
     flag:=true;
     exit;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  vivod.Lines.Clear;
end;

procedure TForm1.mfileClick(Sender: TObject);
begin

end;

procedure TForm1.spravkaClick(Sender: TObject);
begin
  showmessage('Студент Группы ИВТ-19-2 Пилипенко данила,задача 25 Треугольник задан координатами своих вершин. Найти его периметр и площадь.');
end;

procedure TForm1.vihodClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.fopenClick(Sender: TObject);
begin
  if OD1.execute then
  begin
      if OD1.FileName <> '' then
        begin
          read_params (c[i].x, c[i].y, c[i].x1, c[i].y1, c[i].x2, c[i].y2, OD1.filename);
          kor11.Text:= floattostr( c[i].x );
          kor12.Text:= floattostr( c[i].y );
          kor21.Text:= floattostr( c[i].x1 );
          kor22.Text:= floattostr( c[i].y1 );
          kor31.Text:= floattostr( c[i].x2 );
          kor32.Text:= floattostr( c[i].y2 );
        end;
    end;
end;

procedure TForm1.fsaveClick(Sender: TObject);
begin
  if SD1.Execute then
    save_params(x,y,x1,y1,x2,y2,SD1.FileName);
end;

procedure TForm1.fsaveasClick(Sender: TObject);
begin
    if SD2.Execute then
    if SD2.FileName <> '' then
      begin
        save_dat(c,x,y,x1,y1,x2,y2,SD2.FileName);
      end;
end;

procedure TForm1.vivodChange(Sender: TObject);
begin

end;

end.

