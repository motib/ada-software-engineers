package P is

  protected type PT is
    entry E(X: access Integer);
  end PT;

  task type T is
    entry E(X: access Integer);
  end T;

end P;

