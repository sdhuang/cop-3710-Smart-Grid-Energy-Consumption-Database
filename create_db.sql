CREATE SEQUENCE id_seq;

CREATE TABLE customer (
    cus_id NUMBER PRIMARY KEY,
    cus_name VARCHAR2(100),
    cus_email VARCHAR2(100),
    cus_phone VARCHAR2(25),
    cus_reg_time TIMESTAMP(0)
);

CREATE TABLE meter (
    mtr_id NUMBER PRIMARY KEY,
    cus_id NUMBER,
    mtr_address VARCHAR2(255),
    mtr_install_time TIMESTAMP(0),
    CONSTRAINT fk_cus FOREIGN KEY (cus_id) REFERENCES customer(cus_id)
);

CREATE TABLE usage (
    use_time TIMESTAMP(0),
    mtr_id NUMBER,
    use_active NUMBER,
    use_reactive NUMBER,
    use_voltage NUMBER,
    use_intensity NUMBER,
    use_sub_mtr_1 NUMBER,
    use_sub_mtr_2 NUMBER,
    use_sub_mtr_3 NUMBER,
    CONSTRAINT pk_use PRIMARY KEY (mtr_id, use_time),
    CONSTRAINT fk_meter FOREIGN KEY (mtr_id) REFERENCES meter(mtr_id)
);

CREATE TABLE threshold (
    th_id NUMBER(12) PRIMARY KEY,
    th_rule VARCHAR2
);

CREATE TABLE peak_event (
    mtr_id NUMBER,
    use_time TIMESTAMP,
    th_id NUMBER,
    CONSTRAINT pk_peak PRIMARY KEY (mtr_id, use_time, th_id),
    CONSTRAINT fk_meter FOREIGN KEY (mtr_id) REFERENCES meter(mtr_id),
    CONSTRAINT fk_time FOREIGN KEY (use_time) REFERENCES usage(use_time),
    CONSTRAINT fk_rule FOREIGN KEY (th_id) REFERENCES threshold(th_id)
);
