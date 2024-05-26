CREATE MIGRATION m1hqpu3p5pm54ou6hdxdlsmsyxxubsra3z4ni5fn5eb3z2igt4iy5q
    ONTO m15z6k7xuakpfooyj3m5axxlus3c7d3nuncx4ol6k4dipflivihfpq
{
  ALTER FUNCTION default::str_format(format: std::str, VARIADIC args: std::str) USING (std::array_join(std::array_agg((FOR chunk IN std::enumerate(std::array_unpack((std::str_split(format, '?'))[:-1]))
  UNION 
      ('' IF ((args)[chunk.0] = '') ELSE (chunk.1 ++ (args)[chunk.0])))), ''));
};
