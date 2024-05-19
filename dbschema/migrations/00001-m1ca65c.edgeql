CREATE MIGRATION m1ca65cu5e3udc3x237kljprz5qugflocapgk3xonxblaei4uzp2oa
    ONTO initial
{
  CREATE TYPE default::FeautureCategory {
      CREATE LINK parent: default::FeautureCategory;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  CREATE ABSTRACT TYPE default::Timestamps {
      CREATE PROPERTY created_at: std::datetime {
          CREATE REWRITE
              INSERT 
              USING (std::datetime_of_statement());
      };
      CREATE PROPERTY update_at: std::datetime {
          CREATE REWRITE
              UPDATE 
              USING (std::datetime_of_statement());
      };
  };
  CREATE TYPE default::UserType {
      CREATE REQUIRED PROPERTY description: std::str;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  CREATE TYPE default::Feature EXTENDING default::Timestamps {
      CREATE LINK category: default::FeautureCategory;
      CREATE REQUIRED MULTI LINK target_users: default::UserType;
      CREATE PROPERTY algorithm_scheme: std::str;
      CREATE PROPERTY alternative_flows: array<std::str>;
      CREATE PROPERTY data_scheme: std::str;
      CREATE REQUIRED PROPERTY description: std::str;
      CREATE PROPERTY exceptions: array<std::str>;
      CREATE REQUIRED PROPERTY name: std::str;
      CREATE PROPERTY normal_flow: std::str;
      CREATE PROPERTY post_conditions: array<std::str>;
      CREATE PROPERTY pre_conditions: array<std::str>;
      CREATE PROPERTY trigger_condition: std::str;
  };
  CREATE TYPE default::Project EXTENDING default::Timestamps {
      CREATE MULTI LINK features: default::Feature;
      CREATE MULTI LINK users: default::UserType;
      CREATE PROPERTY background: std::str;
      CREATE PROPERTY metrics: std::str;
      CREATE PROPERTY objectives: std::str;
      CREATE PROPERTY opportunity: std::str;
  };
};
