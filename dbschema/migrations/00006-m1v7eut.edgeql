CREATE MIGRATION m1v7eut2yare7bbgdrsfpr3niv3fyyfrqnhmzsxsr57jvyvlvj25bq
    ONTO m1k6qjik6mgyi445njftazt47yfe6nkn3kr6cg4mm5rapqyquvhn5a
{
  ALTER FUNCTION default::md_header(text: std::str, level: std::int64) USING (((std::str_repeat('#', level) ++ ' ') ++ text));
  CREATE FUNCTION default::md_ordered_list(item: tuple<std::int64, std::str>, level: std::int64) ->  std::str USING ((((std::str_repeat(' ', ((level - 1) * 2)) ++ <std::str>item.0) ++ '. ') ++ item.1));
  CREATE FUNCTION default::md_unordered_list(item: std::str, level: std::int64) ->  std::str USING (((std::str_repeat(' ', ((level - 1) * 2)) ++ '- ') ++ item));
};
