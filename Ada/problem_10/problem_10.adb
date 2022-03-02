package body Problem_10 is

    function Solution_1 return Int128 is
        Primes : P.Vector;
        Inc : Integer := 3;
        Divisible : Boolean := false;
        Sum : Int128 := 0;
    begin

        Primes.append(2);

        while Inc < 2_000_000 loop
            Divisible := false;
            for Prime of Primes loop
                if Inc mod Prime = 0 then
                    Divisible := true;
                end if;
            end loop;
            if Divisible = false then
                Primes.append(Inc);
            end if;
            Inc := Inc + 2;
        end loop;

        for Prime of Primes loop
            Sum := Sum + Int128(Prime);
        end loop;

        return Sum;

    end Solution_1;

    function Solution_2(Limit : Integer) return Int128 is
        Lim : constant Int128 := Int128(Limit);
        Is_Prime : array( Int128 range 1 .. Lim ) of Boolean := (others
        => false);
        N : Int128 := 0;
        W: Int128 := 0;
        Sum : Int128 := 0;
        X,Y : Int128;
    begin

        X := 1;
        Y := 3;
        outer_step_1:
        loop
            N := (4*X*X) + 1;
            exit when N > Lim;
            case N mod 60 is
                when 1 | 13 | 17 | 29 | 37 | 41 | 49 | 53 =>
                    Is_Prime(N) := Is_Prime(N) xor true;
                when others =>
                    null;
            end case;
            Y := 3;
            loop
                N := (4*X*X) + (Y*Y);
                exit when N > Lim;
                case N mod 60 is
                    when 1 | 13 | 17 | 29 | 37 | 41 | 49 | 53 =>
                        Is_Prime(N) := Is_Prime(N) xor true;
                    when others =>
                        null;
                end case;
                Y := Y + 2;
            end loop;
            X := X + 1;
        end loop outer_step_1;

        X := 1;
        Y := 4;
        outer_step_2:
        loop
            N := (3*X*X) + 4;
            exit when N > Lim;
            case N mod 60 is
                when 7 | 19 | 31 | 43 =>
                    Is_Prime(N) := Is_Prime(N) xor true;
                when others =>
                    null;
            end case;
            Y := 4;
            loop
                N := (3*X*X) + (Y*Y);
                exit when N > Lim;
                case N mod 60 is
                    when 7 | 19 | 31 | 43 =>
                        Is_Prime(N) := Is_Prime(N) xor true;
                    when others =>
                        null;
                end case;
                Y := Y + 2;
            end loop;
            X := X + 2;
        end loop outer_step_2;

        X := 2;
        Y := 3;
        outer_step_3:
        loop
            N := (3*X*X) - (X-1)*(X-1);
            exit when N > Lim;
            case N mod 60 is
                when 11 | 23 | 47 | 59 =>
                    Is_Prime(N) := Is_Prime(N) xor true;
                when others =>
                    null;
            end case;
            Y := 3;
            loop
                N := (3*X*X) - (X-Y)*(X-Y);
                exit when N > Lim or (X-Y) <= 0;
                case N mod 60 is
                    when 11 | 23 | 47 | 59 =>
                        Is_Prime(N) := Is_Prime(N) xor true;
                    when others =>
                        null;
                end case;
                Y := Y + 2;
            end loop;
            X := X + 1;
        end loop outer_step_3;

        N := 3;
        while N <= Lim loop
            if Is_Prime(N) then
                W := N*N;
                while W <= Lim loop
                    Is_Prime(W) := false;
                    W := W + (N*N);
                end loop;
            end if;
            N := N + 2;
        end loop;

        Is_Prime(2) := true;
        Is_Prime(3) := true;
        Is_Prime(5) := true;

        for I in Is_Prime'Range loop
            if Is_Prime(I) then
                Sum := Sum + I;
            end if;
        end loop;

        return Sum;

    end Solution_2;

    procedure Test_Solution_1 is
        Solution : constant Int128 := 142913828922;
    begin
        Assert( Solution_1 = Solution );
    end Test_Solution_1;

    procedure Test_Solution_2 is
        Solution : constant Int128 := 142913828922;
    begin
        Assert( Solution_2( 2_000_000 ) = Solution );
    end Test_Solution_2;

    function Get_Solutions return Solution_Case is
        Ret : Solution_Case;
    begin
        Set_Name( Ret, "Problem 10");
        Add_Test( Ret, Test_Solution_1'Access );
        Add_Test( Ret, Test_Solution_2'Access );
        return Ret;
    end Get_Solutions;

end Problem_10;
