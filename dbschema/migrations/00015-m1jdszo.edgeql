CREATE MIGRATION m1jdszor3br45xcusldw4geh4vrcgaysgrffybfks7b6s5wdh6nifa
    ONTO m14vw7gtzb4wsdxyx5u6l4jwdwdyuxoiwpaetam2b3uavzxu4vdjpa
{
  DROP FUNCTION default::md_header(text: std::str, level: std::int64);
  ALTER FUNCTION default::str_format(format: std::str, VARIADIC args: std::str) USING (std::array_join(std::array_agg((FOR chunk IN std::enumerate(std::array_unpack((std::str_split(format, '?'))[:-1]))
  UNION 
      ('' IF ((args)[chunk.0] = '') ELSE (chunk.1 ++ (args)[chunk.0])))), ''));
  CREATE FUNCTION default::md_use_case(feature: default::Feature) ->  std::str USING ((default::str_format('# ?\n\n\n            Описание:  ?\n\n\n            Пользователи:  ?\n\n\n            Триггер:  ?\n\n\n            Предусловия:  ?\n\n\n            Постусловия:  ?\n\n\n            Обычный сценарий:  ?\n\n\n            Альтернативные сценарии:  ?\n\n\n            Исключения:  ?\n\n\n            Дата создания:  ?\n\n            Дата обновления: ?\n', feature.name, feature.description, (std::array_join(std::array_agg(default::md_unordered_list(feature.target_users.name, 1)), '\n') ?? ''), feature.trigger_condition, (std::array_join(std::array_agg(default::md_ordered_list(std::enumerate(std::array_unpack(feature.pre_conditions)), 1)), '\n') ?? ''), (std::array_join(std::array_agg(default::md_ordered_list(std::enumerate(std::array_unpack(feature.post_conditions)), 1)), '\n') ?? ''), feature.normal_flow, (std::array_join(feature.alternative_flows, '\n\n') ?? ''), (std::array_join(feature.exceptions, '\n\n') ?? ''), (std::to_str(feature.created_at, 'DD.MM.YYYY') ?? ''), (std::to_str(feature.updated_at, 'DD.MM.YYYY') ?? '')) ?? ''));
  ALTER TYPE default::Feature {
      CREATE PROPERTY use_case_md := (default::md_use_case(__source__));
  };
};
