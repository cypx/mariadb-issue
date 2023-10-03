use erpdb;
INSERT INTO A_WMS_PRODUCTS_ATTRIBUTES (
                                PRODUCT_ID,
                                SKU,
                                ATTRIBUTE_ID,
                                ATTRIBUTE_CODE,
                                FRONTEND_LABEL,
                                VALUE,
                                IS_REQUIRED
                )
                SELECT DISTINCT
                        ce.entity_id AS product_id,
                        ce.sku,
                        ea.attribute_id,
                        ea.attribute_code,
                        ea.frontend_label,
                        coalesce(
                                eaov_1.value,
                                eaov_0.value,
                                eaov2.value,
                                CASE ea.backend_type
                                   WHEN 'varchar' THEN coalesce(ce_varchar_1.value, ce_varchar_0.value)
                                   WHEN 'int' THEN ce_int.value
                                   WHEN 'text' THEN ce_text.value
                                   WHEN 'decimal' THEN ce_decimal.value
                                   WHEN 'datetime' THEN ce_datetime.value
                                   ELSE ea.backend_type
                                END
                        ) AS value,
                        ea.is_required AS required
                FROM magentodb.catalog_product_entity AS ce
                LEFT JOIN magentodb.eav_attribute AS ea
                        ON ea.entity_type_id = 4
                LEFT JOIN magentodb.catalog_product_entity_varchar AS ce_varchar_0
                        ON ce.entity_id = ce_varchar_0.entity_id
                        AND ea.attribute_id = ce_varchar_0.attribute_id
                        AND ea.backend_type = 'varchar'
                        AND ce_varchar_0.store_id = 0
                LEFT JOIN magentodb.catalog_product_entity_varchar AS ce_varchar_1
                        ON ce.entity_id = ce_varchar_1.entity_id
                        AND ea.attribute_id = ce_varchar_1.attribute_id
                        AND ea.backend_type = 'varchar'
                        AND ce_varchar_1.store_id = 1
                LEFT JOIN magentodb.catalog_product_entity_int AS ce_int
                        ON ce.entity_id = ce_int.entity_id
                        AND ea.attribute_id = ce_int.attribute_id
                        AND ea.backend_type = 'int'
                LEFT JOIN magentodb.eav_attribute_option AS eao
                  ON ea.attribute_id = eao.attribute_id AND ce_varchar_0.value = eao.option_id
                  LEFT JOIN magentodb.eav_attribute_option_value eaov_0
                        ON eaov_0.option_id = eao.option_id
                LEFT JOIN magentodb.eav_attribute_option AS eao3
                  ON ea.attribute_id = eao.attribute_id AND ce_varchar_1.value = eao.option_id
                  LEFT JOIN magentodb.eav_attribute_option_value eaov_1
                        ON eaov_1.option_id = eao.option_id
                LEFT JOIN magentodb.eav_attribute_option AS eao2
                        ON ea.attribute_id = eao2.attribute_id AND ce_int.value = eao2.option_id
                        LEFT JOIN magentodb.eav_attribute_option_value eaov2
                                ON eaov2.option_id = eao2.option_id
                LEFT JOIN magentodb.catalog_product_entity_text AS ce_text
                        ON ce.entity_id = ce_text.entity_id
                        AND ea.attribute_id = ce_text.attribute_id
                        AND ea.backend_type = 'text'
                LEFT JOIN magentodb.catalog_product_entity_decimal AS ce_decimal
                        ON ce.entity_id = ce_decimal.entity_id
                        AND ea.attribute_id = ce_decimal.attribute_id
                        AND ea.backend_type = 'decimal'
                LEFT JOIN magentodb.catalog_product_entity_datetime AS ce_datetime
                        ON ce.entity_id = ce_datetime.entity_id
                        AND ea.attribute_id = ce_datetime.attribute_id
                        AND ea.backend_type = 'datetime';