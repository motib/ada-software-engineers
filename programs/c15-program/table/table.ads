package Table is
  Translate: array(1..10) of Character;
end Table;
-- Package specification will not compile with pragma
pragma Elaborate_Body(Table);
