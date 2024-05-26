CREATE MIGRATION m1kk7c5tcngu7ve6gb7yrysv3zrlr2yv3aork4mz5jsjhemcanog5a
    ONTO m1v7eut2yare7bbgdrsfpr3niv3fyyfrqnhmzsxsr57jvyvlvj25bq
{
  CREATE FUNCTION default::md_br() ->  std::str USING ('  ');
  ALTER FUNCTION default::md_ordered_list(item: tuple<std::int64, std::str>, level: std::int64) USING ((((std::str_repeat(' ', ((level - 1) * 2)) ++ <std::str>(item.0 + 1)) ++ '. ') ++ item.1));
};
