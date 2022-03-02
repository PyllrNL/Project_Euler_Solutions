with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

procedure problem_9 is

    type Int64 is range -2**63 .. 2**63 - 1;

    function Solve_1 return Int64 is
        X_1 : Constant Float := (1.0 + Sqrt(1.0 - (4.0*(-500.0)))) / 2.0;
        X_2 : Constant Float := (1.0 - Sqrt(1.0 - (4.0*(-500.0)))) / 2.0;
        Max,Temp,A,B,C : Int64;
    begin
        if X_1 >= X_2 then
            Max := Int64(X_1);
        else
            Max := Int64(X_2);
        end if;

        for M in reverse 1 .. Max loop
            for N in reverse 1 .. M - 1 loop
                Temp := 2*M*M + 2*N*M;
                if Temp = 1000 then
                    A := M*M - N*N;
                    B := 2*M*N;
                    C := M*M + N*N;
                    return A*B*C;
                end if;
            end loop;
        end loop;

        return 0;
    end Solve_1;

begin

    Put_Line(Int64'Image(Solve_1));

end problem_9;
