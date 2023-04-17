DROP INDEX PK_upCategory;

/* ���� ī�װ� */
DROP TABLE upCategory 
	CASCADE CONSTRAINTS;

/* ���� ī�װ� */
CREATE TABLE upCategory (
	upcg_code number(8) NOT NULL, /* ���� ī�װ� �ڵ� */
	upcg_name varchar2(30) NOT NULL /* ���� ī�װ��� */
);

COMMENT ON TABLE upCategory IS '���� ī�װ�';

COMMENT ON COLUMN upCategory.upcg_code IS '���� ī�װ� �ڵ�';

COMMENT ON COLUMN upCategory.upcg_name IS '���� ī�װ���';

CREATE UNIQUE INDEX PK_upCategory
	ON upCategory (
		upcg_code ASC
	);

ALTER TABLE upCategory
	ADD
		CONSTRAINT PK_upCategory
		PRIMARY KEY (
			upcg_code
		);
-----------------------------------------------
DROP INDEX PK_downCategory;

/* ���� ī�װ� */
DROP TABLE downCategory 
	CASCADE CONSTRAINTS;

/* ���� ī�װ� */
CREATE TABLE downCategory (
	upcg_code number(8) NOT NULL, /* ���� ī�װ� �ڵ� */
	downcg_code number(8) NOT NULL, /* ���� ī�װ� �ڵ� */
	downcg_name varchar2(30) NOT NULL /* ���� ī�װ��� */
);

COMMENT ON TABLE downCategory IS '���� ī�װ�';

COMMENT ON COLUMN downCategory.upcg_code IS '���� ī�װ� �ڵ�';

COMMENT ON COLUMN downCategory.downcg_code IS '���� ī�װ� �ڵ�';

COMMENT ON COLUMN downCategory.downcg_name IS '���� ī�װ���';

CREATE UNIQUE INDEX PK_downCategory
	ON downCategory (
		upcg_code ASC,
		downcg_code ASC
	);

ALTER TABLE downCategory
	ADD
		CONSTRAINT PK_downCategory
		PRIMARY KEY (
			upcg_code,
			downcg_code
		);

ALTER TABLE downCategory
	ADD
		CONSTRAINT FK_upCategory_TO_downCategory
		FOREIGN KEY (
			upcg_code
		)
		REFERENCES upCategory (
			upcg_code
		);
---------------------------------------------        
DROP INDEX PK_product;

/* ��ǰ */
DROP TABLE product 
	CASCADE CONSTRAINTS;

/* ��ǰ */
CREATE TABLE product (
	pnum number(8) NOT NULL, /* ��ǰ��ȣ */
	pname varchar2(100) NOT NULL, /* ��ǰ�� */
	price number(8) NOT NULL, /* ��ǰ ���� */
	saleprice number(8), /* ��ǰ �ǸŰ� */
	pcompany varchar2(50), /* ������ */
	pcontents varchar2(1000), /* ��ǰ ���� */
	pspec varchar2(20), /* ��ǰ ���� */
	point number(8), /* ����Ʈ */
	pindate date, /* ��ǰ �԰��� */
	pimage1 varchar2(100), /* �̹���1 */
	pimage2 varchar2(100), /* �̹���2 */
	pimage3 varchar2(100), /* �̹���3 */
	upcg_code number(8), /* ���� ī�װ� �ڵ� */
	downcg_code number(8) /* ���� ī�װ� �ڵ� */
);

COMMENT ON TABLE product IS '��ǰ';

COMMENT ON COLUMN product.pnum IS '��ǰ��ȣ';

COMMENT ON COLUMN product.pname IS '��ǰ��';

COMMENT ON COLUMN product.price IS '��ǰ ����';

COMMENT ON COLUMN product.saleprice IS '��ǰ �ǸŰ�';

COMMENT ON COLUMN product.pcompany IS '������';

COMMENT ON COLUMN product.pcontents IS '��ǰ ����';

COMMENT ON COLUMN product.pspec IS '��ǰ ����';

COMMENT ON COLUMN product.point IS '����Ʈ';

COMMENT ON COLUMN product.pindate IS '��ǰ �԰���';

COMMENT ON COLUMN product.pimage1 IS '�̹���1';

COMMENT ON COLUMN product.pimage2 IS '�̹���2';

COMMENT ON COLUMN product.pimage3 IS '�̹���3';

COMMENT ON COLUMN product.upcg_code IS '���� ī�װ� �ڵ�';

COMMENT ON COLUMN product.downcg_code IS '���� ī�װ� �ڵ�';

CREATE UNIQUE INDEX PK_product
	ON product (
		pnum ASC
	);

ALTER TABLE product
	ADD
		CONSTRAINT PK_product
		PRIMARY KEY (
			pnum
		);

ALTER TABLE product
	ADD
		CONSTRAINT FK_downCategory_TO_product
		FOREIGN KEY (
			upcg_code,
			downcg_code
		)
		REFERENCES downCategory (
			upcg_code,
			downcg_code
		);

ALTER TABLE product
	ADD
		CONSTRAINT FK_upCategory_TO_product
		FOREIGN KEY (
			upcg_code
		)
		REFERENCES upCategory (
			upcg_code
		);
