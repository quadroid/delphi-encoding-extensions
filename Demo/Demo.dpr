program Demo;

uses
  Vcl.Forms,
  UDemoWindow in 'UDemoWindow.pas' {DemoWindow};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDemoWindow, DemoWindow);
  Application.Run;
end.
