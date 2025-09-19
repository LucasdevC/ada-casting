with Ada.Text_IO; use Ada.Text_IO;
with Ada.Delay; use Ada.Delay;

procedure Main is

   LED_BUILTIN : Integer := 13;
   Pino_12    : Integer := 12;

   procedure Pin_Mode(Pin : Integer; Mode : String) is
   begin
   end Pin_Mode;

   procedure Digital_Write(Pin : Integer; Value : String) is
   begin
   end Digital_Write;

begin

   Pin_Mode(LED_BUILTIN, "OUTPUT");
   Pin_Mode(Pino_12, "OUTPUT");

   loop
      Digital_Write(LED_BUILTIN, "LOW");
      Digital_Write(Pino_12, "LOW");
      Ada.Delay.Delay_Seconds(0.5);

      Digital_Write(LED_BUILTIN, "HIGH");
      Digital_Write(Pino_12, "LOW");
      Ada.Delay.Delay_Seconds(0.25);

      Digital_Write(LED_BUILTIN, "LOW");
      Digital_Write(LED_BUILTIN, "HIGH");
      Ada.Delay.Delay_Seconds(0.25);

      Digital_Write(LED_BUILTIN, "HIGH");
      Digital_Write(LED_BUILTIN, "LOW");
      Ada.Delay.Delay_Seconds(0.125);

      for I in 1..7 loop
         Digital_Write(LED_BUILTIN, "HIGH");
         Digital_Write(LED_BUILTIN, "LOW");
         Ada.Delay.Delay_Seconds(1.0);
      end loop;

   end loop;

end Main;

