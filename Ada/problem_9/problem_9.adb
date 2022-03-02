package body Problem_9 is

    function Solution_1 return Int64 is
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
    end Solution_1;

    procedure Test_Solution_1 is
        Solution : constant Int64 := 31875000;
    begin
        Assert( Solution_1 = Solution );
    end Test_Solution_1;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 9");
        Add_Test( Ret, Test_Solution_1'Access );
        return Ret;
    end Get_Solutions;

end Problem_9;
