module default {
    abstract type Timestamps {
        created_at: datetime {
            rewrite insert using (datetime_of_statement())
        }
        updated_at: datetime {
            rewrite update using (datetime_of_statement())
        }
    }

    type Feature extending Timestamps {
        category: FeautureCategory;
        required name: str;
        required description: str;
        required multi target_users: UserType;
        trigger_condition: str;
        pre_conditions: array<str>;
        post_conditions: array<str>;
        normal_flow: str;
        alternative_flows: array<str>;
        exceptions: array<str>;
        data_scheme: str;
        algorithm_scheme: str;
        required project: Project;
    }

    type FeautureCategory {
        required name: str;
        parent: FeautureCategory;
    }

    type UserType {
        required name: str;
        required description: str;
        required project: Project;
    }

    type Project extending Timestamps {
        required name: str;
        background: str;
        opportunity: str;
        objectives: str;
        metrics: str;
        multi users := .<project[is UserType];
        multi features := .<project[is Feature];
    }
}
