-- table list
SELECT TABLE_NAME FROM TABS;

-- view list
SELECT VIEW_NAME FROM USER_VIEWS;

-- synonym list
SELECT SYNONYM_NAME FROM ALL_SYNONYMS WHERE OWNER = 'hoge';
