CREATE MIGRATION m1k57o7b6ef737bn676klw4twjcaseezjw3kkmqubed4xiftncz5zq
    ONTO m1qkthbnaqy52meobf7qq4xevcspput6ajbmesbwn2xbrz5zhriaeq
{
  ALTER FUNCTION default::str_format(format: std::str, VARIADIC args: std::str) USING (std::array_join(std::array_agg((FOR chunk IN std::enumerate(std::array_unpack((std::str_split(format, '?'))[:-1]))
  UNION 
      ('' IF (NOT (EXISTS ((args)[chunk.0])) OR ((args)[chunk.0] = '')) ELSE (chunk.1 ++ (args)[chunk.0])))), ''));
};
