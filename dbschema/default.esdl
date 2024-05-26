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
        use_case_md := md_use_case(__source__)
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

    function str_format(format: str, variadic args: str) -> str using (
        array_join(
            array_agg((
                for chunk in enumerate(array_unpack(str_split(format, '?')[:-1])) union (
                    '' if args[chunk.0] = '' else chunk.1 ++ args[chunk.0]
                )
            )), 
            ''
        )
    );

    function md_unordered_list(item: str, level: int64) -> str using (
        str_repeat(' ', (level - 1) * 2) ++ '- ' ++ item
    );

    function md_ordered_list(item: tuple<int64, str>, level: int64) -> str using (
        str_repeat(' ', (level - 1) * 2) ++ <str>(item.0 + 1) ++ '. ' ++ item.1
    );

    function md_use_case(feature: Feature) -> str using (
        str_format(
            '# ?\n' ++
            '## Описание\n?\n' ++
            '## Пользователи\n?\n' ++
            '## Триггер\n?\n' ++
            '## Предусловия\n?\n' ++
            '## Постусловия\n?\n' ++
            '## Обычный сценарий\n?\n' ++
            '## Альтернативные сценарии\n?\n' ++
            '## Исключения\n?\n' ++
            '\nДата последнего изменения: ?\n',
            feature.name,
            feature.description,
            array_join(array_agg(md_unordered_list(feature.target_users.name, 1)), '\n') ?? '',
            feature.trigger_condition,
            array_join(array_agg(md_ordered_list(enumerate(array_unpack(feature.pre_conditions)), 1)), '\n') ?? '',
            array_join(array_agg(md_ordered_list(enumerate(array_unpack(feature.post_conditions)), 1)), '\n') ?? '',
            feature.normal_flow,
            array_join(feature.alternative_flows, '\n\n') ?? '',
            array_join(feature.exceptions, '\n\n') ?? '',
            to_str(feature.updated_at ?? feature.created_at, 'DD.MM.YYYY'),
        ) ?? ''
    );
}
