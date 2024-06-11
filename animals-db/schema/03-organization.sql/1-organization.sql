CREATE TABLE organization (
    "id"                   BIGSERIAL    NOT NULL,
    "name"                 VARCHAR(255)         ,
    "address"              VARCHAR(255)         ,
    "inn"                  VARCHAR(12)          ,
    "kpp"                  VARCHAR(9)           ,
    "organization_type_id" BIGINT       NOT NULL,
    "legal_type_id"        BIGINT       NOT NULL,
    "municipality_id"      BIGINT       NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (legal_type_id) REFERENCES dic_legal_type(id),
    FOREIGN KEY (locality_id) REFERENCES dic_municipality(id),
    FOREIGN KEY (organization_type_id) REFERENCES dic_organization_type(id)
);
