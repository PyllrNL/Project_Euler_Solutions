with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

package Test_Solution is

    type Solution is access procedure;

    package SU renames Ada.Strings.Unbounded;
    package P is new Ada.Containers.Vectors( Index_Type => Natural,
        Element_Type => Solution);

    Assertion_Error : Exception;

    procedure Assert( Test : Boolean );

    type Solution_Case is record
        Name : SU.Unbounded_String;
        Tests : P.Vector;
    end record;

    procedure Set_Name( C : in out Solution_Case; Name : String );
    function Get_Name( C : in Solution_Case ) return String;

    procedure Add_Test( C : in out Solution_Case; Func : Solution );


end Test_Solution;
