unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,
  UnMod1;

type

  { TVis_Form1 }

  TVis_Form1 = class(TForm) //класс формы
    MainMenu1: TMainMenu; //поля класса TVis_Form1
    MainMenu2: TMainMenu;
    MenuFile: TMenuItem;
    Menu_spravka: TMenuItem;
    Menu_exit: TMenuItem;
    MenuOpen_File: TMenuItem;
    MenuSave_File: TMenuItem;
    MenuSave_File_report: TMenuItem;
    OpenDialog1: TOpenDialog;
    Res_Label: TLabel;
    SaveDialog1: TSaveDialog;
    vich_button: TButton;
    Visota: TEdit;
    Visota_laib: TLabel;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);// объявление методов класса TVis_Form1
    procedure MenuFileClick(Sender: TObject);
    procedure Menu_spravkaClick(Sender: TObject);
    procedure Menu_exitClick(Sender: TObject);
    procedure MenuOpen_FileClick(Sender: TObject);
    procedure MenuSave_File_reportClick(Sender: TObject);
    procedure MenuSave_FileClick(Sender: TObject);
    procedure VisotaChange(Sender: TObject);
    procedure Visota_laibClick(Sender: TObject);
    procedure R2_EditChange(Sender: TObject);
    procedure Res_LabelClick(Sender: TObject);
    procedure vich_buttonClick(Sender: TObject);
    procedure DataFromForm();   //конец списка методов класса
  private

  public

  end;

var
  Vis_Form1: TVis_Form1; //объект класса TVis_Form1
  flag:boolean;
  i:integer;
  c: Tcalc;
implementation

{$R *.lfm}

{ TVis_Form1 }

procedure TVis_Form1.DataFromForm(); //определение метода класса.
begin
  if TryStrToFloat(Visota.Text, c[i].h) = false then
    begin
    ShowMessage('Неправильно введён параметр h');
    flag:=false;
    exit;
    end;
end;

procedure TVis_Form1.vich_buttonClick(Sender: TObject); // описание метода. имя метода класса,TVis_Form1-имя класса указывается
var
    k: integer;
begin
    k:=1;
    DataFromForm();
    if flag=true then
      begin
        if k>= 1 then
        begin
             StringGrid1.RowCount:=StringGrid1.RowCount+1;
        end;
        while StringGrid1.Cells[0,k]<>'' do
          begin
            inc(k);
          end;
    c[i].t:=calc_c(c[i].h,c[i].t);
    StringGrid1.Cells[0,k]:=FloatToStr(c[i].h);
    StringGrid1.Cells[1,k]:=FloatToStr(c[i].t);
    inc(i);

    end
   else
   begin
     flag:=true;
     exit;
   end;
end;

procedure TVis_Form1.MenuOpen_FileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      if OpenDialog1.FileName <> '' then
        begin
          read_params (c[i].h, OpenDialog1.filename);
          Visota.Text:= floattostr( c[i].h );
        end;
    end;
end;

procedure TVis_Form1.MenuSave_FileClick(Sender: TObject);
begin
  DataFromForm();
    if flag= true then
    begin
      if SaveDialog1.Execute then
        if SaveDialog1.FileName <> '' then
          begin
            save_params(c[i].h, SaveDialog1.FileName);
          end;
     end
     else
       begin
         flag:=true;
         exit;
       end;
end;

procedure TVis_Form1.VisotaChange(Sender: TObject);
begin

end;

procedure TVis_Form1.Visota_laibClick(Sender: TObject);
begin

end;

procedure TVis_Form1.R2_EditChange(Sender: TObject);
begin

end;

procedure TVis_Form1.Res_LabelClick(Sender: TObject);
begin

end;

procedure TVis_Form1.MenuSave_File_reportClick(Sender: TObject);   //сохранения отчёта
begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      begin
        save_dat(c,SaveDialog1.FileName);
      end;
end;

procedure TVis_Form1.FormCreate(Sender: TObject);
begin
  i:=1;
  flag:=true;
  StringGrid1.Cells[0,0]:='h';
  StringGrid1.Cells[1,0]:='t';
end;

procedure TVis_Form1.MenuFileClick(Sender: TObject);
begin

end;

procedure TVis_Form1.Menu_spravkaClick(Sender: TObject);
begin
  showmessage('Студент Группы ИВТ-19-2 Пилипенко данила,задача 10 Определить время падения камня на поверхности земли с высоты h.');
end;

procedure TVis_Form1.Menu_exitClick(Sender: TObject);
begin
  Vis_Form1.close;
end;

end.

