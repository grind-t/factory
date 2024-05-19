CREATE MIGRATION m1dfcdf7xlrftlmq2lphqsweasf6ub2vcs4yekmnpywkswy53gfxua
    ONTO m16gb2y5a36gz5znro5g6oi6gvta3s67cbghjhpsqtofiwv55t2xyq
{
  ALTER TYPE default::Feature {
      CREATE REQUIRED LINK project: default::Project {
          SET REQUIRED USING (<default::Project>{});
      };
  };
  ALTER TYPE default::Project {
      ALTER LINK features {
          USING (.<project[IS default::Feature]);
      };
  };
  ALTER TYPE default::UserType {
      CREATE REQUIRED LINK project: default::Project {
          SET REQUIRED USING (<default::Project>{});
      };
  };
  ALTER TYPE default::Project {
      ALTER LINK users {
          USING (.<project[IS default::UserType]);
      };
  };
};
