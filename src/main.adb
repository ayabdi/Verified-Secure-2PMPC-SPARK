with Ada.Text_Io;
use Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with GNAT.Sockets; use GNAT;
--with Bob; use Bob;
--with Alice; use Alice;

with Client, server; use Client, Server;
procedure Main is


 begin


   Sockets.Initialize;
   Server.Worker.Start;
   Server.Worker.Done;
   Client.Worker.Start;
   end Main;
