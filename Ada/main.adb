with Ada.Text_IO; use Ada.Text_IO;
with Test_Solution; use Test_Solution;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;

with Problem_1;
with Problem_2;
with Problem_3;
with Problem_4;
with Problem_5;
with Problem_6;
with Problem_7;
with Problem_8;
with Problem_9;
with Problem_10;
with Problem_11;
with Problem_12;
with Problem_13;
with Problem_14;
with Problem_15;
with Problem_16;
with Problem_17;
with Problem_18;
with Problem_19;
with Problem_20;

procedure main is

    use Ada.Strings.Unbounded;

    package Suite is new Ada.Containers.Vectors( Index_Type => Natural,
    Element_Type => Solution_Case);

    Test_Suite : Suite.Vector;
    Count : Integer := 1;
    Failed : Integer := 0;

begin

    Test_Suite.Append(Problem_1.Get_Solutions);
    Test_Suite.Append(Problem_2.Get_Solutions);
    Test_Suite.Append(Problem_3.Get_Solutions);
    Test_Suite.Append(Problem_4.Get_Solutions);
    Test_Suite.Append(Problem_5.Get_Solutions);
    Test_Suite.Append(Problem_6.Get_Solutions);
    Test_Suite.Append(Problem_7.Get_Solutions);
    Test_Suite.Append(Problem_8.Get_Solutions);
    Test_Suite.Append(Problem_9.Get_Solutions);
    Test_Suite.Append(Problem_10.Get_Solutions);
    Test_Suite.Append(Problem_11.Get_Solutions);
    Test_Suite.Append(Problem_12.Get_Solutions);
    Test_Suite.Append(Problem_13.Get_Solutions);
    Test_Suite.Append(Problem_14.Get_Solutions);
    Test_Suite.Append(Problem_15.Get_Solutions);
    Test_Suite.Append(Problem_16.Get_Solutions);
    Test_Suite.Append(Problem_17.Get_Solutions);
    Test_Suite.Append(Problem_18.Get_Solutions);
    Test_Suite.Append(Problem_19.Get_Solutions);
    Test_Suite.Append(Problem_20.Get_Solutions);

    for C of Test_Suite loop
        Put_Line("Running test case: " & To_String(C.Name) );
        Count := 1;
        for T of C.Tests loop
            Put("Running Test" & Integer'Image(Count) & " :");
            declare
            begin
                T.all;
                Put(" Passed");
            exception
                when Assertion_Error =>
                    Failed := Failed + 1;
                    Put(" Failed");
            end;
            New_Line;
            Count := Count + 1;
        end loop;
    end loop;

    New_Line;
    Put_Line("Failed" & Integer'Image(Failed) & " Tests");

end main;
