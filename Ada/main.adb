with Ada.Text_IO; use Ada.Text_IO;
with Test_Solution; use Test_Solution;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;

with Problem_1;
with Problem_2;
with Problem_3;
with Problem_4;

procedure main is

    use Ada.Strings.Unbounded;

    package Suite is new Ada.Containers.Vectors( Index_Type => Natural,
    Element_Type => Solution_Case);

    Test_Suite : Suite.Vector;

begin

    Test_Suite.Append(Problem_1.Get_Solutions);
    Test_Suite.Append(Problem_2.Get_Solutions);
    Test_Suite.Append(Problem_3.Get_Solutions);
    Test_Suite.Append(Problem_4.Get_Solutions);

    for C of Test_Suite loop
        Put_Line("Running test case: " & To_String(C.Name) );
        for T of C.Tests loop
            declare
            begin
                T.all;
            exception
                when Assertion_Error =>
                    Put_Line("Failed test");
            end;
        end loop;
    end loop;

end main;
