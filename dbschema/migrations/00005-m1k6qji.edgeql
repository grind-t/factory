CREATE MIGRATION m1k6qjik6mgyi445njftazt47yfe6nkn3kr6cg4mm5rapqyquvhn5a
    ONTO m1dfcdf7xlrftlmq2lphqsweasf6ub2vcs4yekmnpywkswy53gfxua
{
  CREATE FUNCTION default::md_header(text: std::str, level: std::int64) ->  std::str USING ((((std::str_repeat('#', level) ++ ' ') ++ text) ++ '\n'));
};
