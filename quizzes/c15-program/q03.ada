package P is
  procedure Proc1(I: in Positive);
  procedure Proc2(I: in Natural);
  procedure Proc3(I: in Natural) renames Proc1;
end P;

package body P is
  procedure Proc1(I: in Positive) is
  begin
    null;    
  end Proc1;
  procedure Proc2(I: in Natural) renames Proc1;
end P;

