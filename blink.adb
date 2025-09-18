with Ada.Real_Time;          use Ada.Real_Time;
with STM32.GPIO;             use STM32.GPIO;
with STM32.Board;

procedure Blink is
   Led_Builtin : GPIO_Point renames STM32.Board.LED;
   Pin12       : GPIO_Point := STM32.Board.D12;
   Pin8        : GPIO_Point := STM32.Board.D8;

   Period : constant Time_Span := Milliseconds (3000);
begin
   Configure (Led_Builtin, Output);
   Configure (Pin12, Output);
   Configure (Pin8, Output);

   loop
      delay until Clock + Period;
      Set (Led_Builtin);
      Clear (Pin12);
      Clear (Pin8);

      delay until Clock + Period;
      Set (Pin12);
      Clear (Led_Builtin);
      Clear (Pin8);

      delay until Clock + Period;
      Clear (Led_Builtin);
      Clear (Pin12);
      Set (Pin8);
   end loop;
end Blink;

