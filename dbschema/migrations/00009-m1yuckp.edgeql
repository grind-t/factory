CREATE MIGRATION m1yuckpoc5v3cxltusawbbtrxn6f2bbcdk4y6rm4aj3fqtarj6yuda
    ONTO m1oanz3s2tpt5dyuky6zwhtfghnsskdiwqmqxs5gmp43i4csd7uuga
{
  CREATE FUNCTION default::str_format(format: std::str, VARIADIC args: std::str) ->  std::str USING (std::array_join(std::array_agg((FOR arg IN std::array_unpack(args)
  UNION 
      arg)), ' '));
};
