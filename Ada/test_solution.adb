package body Test_Solution is

    procedure Assert( Test : Boolean ) is
    begin
        if not Test then
            raise Assertion_Error;
        end if;
    end Assert;

    procedure Set_Name( C : in out Solution_Case; Name : String ) is
    begin
        C.Name := SU.To_Unbounded_String(Name);
    end Set_Name;

    function Get_Name( C : in Solution_Case ) return String is
    begin
        return SU.To_String(C.Name);
    end Get_Name;

    procedure Add_Test( C : in out Solution_Case; Func : Solution ) is
    begin
        C.Tests.Append(Func);
    end Add_Test;

end Test_Solution;
