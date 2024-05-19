CREATE MIGRATION m1tjye5iesym55zvo46kyqemkups6toiekbbnz77dp4axbwehcrtlq
    ONTO m1ca65cu5e3udc3x237kljprz5qugflocapgk3xonxblaei4uzp2oa
{
  ALTER TYPE default::Project {
      CREATE REQUIRED PROPERTY name: std::str {
          SET REQUIRED USING (<std::str>{});
      };
  };
};
