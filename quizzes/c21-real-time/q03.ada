pragma Profile(Ravenscar);
package Pack is
  protected P is
    entry E;
  private
    Flag: Boolean := False;
  end P;
end Pack;
package body Pack is
  protected body P is
    entry E when not Flag is
    begin
      null;
    end E;
  end P;
end Pack;
