# e-commerce
It is an e-commerce website project made using JSPs and Servlets in Java. Before downloading and running this project from eclipse, atleast Apache Tomcat 7 server or above should be installed and all the required drivers including ojdbc must be added. Secondly, before running this project, the below three oracle tables must be created. Just copy paste the below codes in oracle sql section and create the tables and then after creating the tables and connecting oracle with eclipse using ojdbc driver, you are good to go.

Table 1.(user_info)

CREATE TABLE  "USER_INFO" 
   (	"USERNAME" VARCHAR2(4000) NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(4000) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(4000) NOT NULL ENABLE
   )
   
   
Table 2.(category)

CREATE TABLE  "CATEGORY" 
   (	"CATEGORY_NAME" VARCHAR2(4000), 
	"CATEGORY_DESC" VARCHAR2(4000)
   )
   
   
Table 3.(product)

CREATE TABLE  "PRODUCT" 
   (	"PRODUCT_NAME" VARCHAR2(4000) NOT NULL ENABLE, 
	"PRODUCT_PRICE" VARCHAR2(4000), 
	"PRODUCT_DESCRIPTION" VARCHAR2(4000), 
	"FILENAME" VARCHAR2(4000)
   )
