# Projeto Semáforo em Ada 🚦

![Ada Lovelace](https://upload.wikimedia.org/wikipedia/commons/4/4e/Ada_Lovelace_portrait.jpg)

## Visão Geral

Este projeto implementa o funcionamento de um **semáforo** utilizando a linguagem **Ada**, tendo sido originalmente desenvolvido em **C++ para Arduino**.  
O objetivo é demonstrar o controle de LEDs em sequência temporal, simulando o comportamento real de um semáforo de trânsito, e explorar a conversão de sistemas embarcados de C++ para Ada.

---

## Motivação

A escolha da linguagem **Ada** deve-se à sua robustez, segurança e aplicabilidade em **sistemas críticos**, como transporte, aviação e automação industrial.  
A conversão de C++ para Ada neste projeto permite:

- Garantir **maior confiabilidade** na manipulação de hardware;  
- Aplicar **boas práticas de programação** para sistemas embarcados;  
- Facilitar a **manutenção e escalabilidade** do código;  
- Entender como linguagens seguras podem ser aplicadas mesmo em projetos pequenos.

---

## Funcionamento do Semáforo

O sistema realiza o seguinte ciclo continuamente:

1. **Vermelho:** LED correspondente aceso, outros LEDs apagados.  
2. **Amarelo:** LED correspondente aceso, outros LEDs apagados.  
3. **Verde:** LED correspondente aceso, outros LEDs apagados.  

Cada fase do semáforo possui **duração de 3 segundos**, garantindo uma simulação consistente do fluxo de trânsito.

---

## Código Ada

```ada
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

