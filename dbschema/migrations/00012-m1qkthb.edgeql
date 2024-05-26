CREATE MIGRATION m1qkthbnaqy52meobf7qq4xevcspput6ajbmesbwn2xbrz5zhriaeq
    ONTO m1hqpu3p5pm54ou6hdxdlsmsyxxubsra3z4ni5fn5eb3z2igt4iy5q
{
  ALTER FUNCTION default::str_format(format: std::str, VARIADIC args: std::str) USING (std::array_join(std::array_agg((FOR chunk IN std::enumerate(std::array_unpack((std::str_split(format, '?'))[:-1]))
  UNION 
      ('' IF (std::len((args)[chunk.0]) > 0) ELSE (chunk.1 ++ (args)[chunk.0])))), ''));
};
