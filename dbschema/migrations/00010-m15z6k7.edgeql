CREATE MIGRATION m15z6k7xuakpfooyj3m5axxlus3c7d3nuncx4ol6k4dipflivihfpq
    ONTO m1yuckpoc5v3cxltusawbbtrxn6f2bbcdk4y6rm4aj3fqtarj6yuda
{
  ALTER FUNCTION default::str_format(format: std::str, VARIADIC args: std::str) USING (std::array_join(std::array_agg((FOR chunk IN std::enumerate(std::array_unpack((std::str_split(format, '?'))[:-1]))
  UNION 
      (chunk.1 ++ (args)[chunk.0]))), ''));
};
