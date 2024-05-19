CREATE MIGRATION m16gb2y5a36gz5znro5g6oi6gvta3s67cbghjhpsqtofiwv55t2xyq
    ONTO m1tjye5iesym55zvo46kyqemkups6toiekbbnz77dp4axbwehcrtlq
{
  ALTER TYPE default::Timestamps {
      ALTER PROPERTY update_at {
          RENAME TO updated_at;
      };
  };
};
