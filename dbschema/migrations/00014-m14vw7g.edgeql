CREATE MIGRATION m14vw7gtzb4wsdxyx5u6l4jwdwdyuxoiwpaetam2b3uavzxu4vdjpa
    ONTO m1k57o7b6ef737bn676klw4twjcaseezjw3kkmqubed4xiftncz5zq
{
  ALTER FUNCTION default::str_format(format: std::str, VARIADIC args: std::str) USING (std::array_join(std::array_agg((FOR chunk IN std::enumerate(std::array_unpack((std::str_split(format, '?'))[:-1]))
  UNION 
      ('' IF (NOT (EXISTS ((args)[chunk.0])) OR (std::str_trim((args)[chunk.0]) = '')) ELSE (chunk.1 ++ (args)[chunk.0])))), ''));
};
