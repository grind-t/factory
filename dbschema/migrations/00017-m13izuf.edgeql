CREATE MIGRATION m13izufs356b3pzigih2zmkglxhuijsycmwzgqeg72thwexdnrahqq
    ONTO m16xkqjrooe3hh6snjqew2bplgzygpqhk6xzuaz7yu3ewtnizmif3a
{
  ALTER FUNCTION default::md_use_case(feature: default::Feature) USING ((default::str_format(((((((((((('# ?\n' ++ '## Описание\n?\n') ++ '## Пользователи\n?\n') ++ '## Триггер\n?\n') ++ '## Предусловия\n?\n') ++ '## Постусловия\n?\n') ++ '## Обычный сценарий\n?\n') ++ '## Альтернативные сценарии\n?\n') ++ '## Исключения\n?\n') ++ '---\n') ++ 'Дата создания: ?\n') ++ 'Дата обновления:  ?\n'), feature.name, feature.description, (std::array_join(std::array_agg(default::md_unordered_list(feature.target_users.name, 1)), '\n') ?? ''), feature.trigger_condition, (std::array_join(std::array_agg(default::md_ordered_list(std::enumerate(std::array_unpack(feature.pre_conditions)), 1)), '\n') ?? ''), (std::array_join(std::array_agg(default::md_ordered_list(std::enumerate(std::array_unpack(feature.post_conditions)), 1)), '\n') ?? ''), feature.normal_flow, (std::array_join(feature.alternative_flows, '\n\n') ?? ''), (std::array_join(feature.exceptions, '\n\n') ?? ''), (std::to_str(feature.created_at, 'DD.MM.YYYY') ?? ''), (std::to_str(feature.updated_at, 'DD.MM.YYYY') ?? '')) ?? ''));
};
