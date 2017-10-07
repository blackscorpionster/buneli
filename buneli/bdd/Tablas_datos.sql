-- ORACLE
BEGIN
Insert into BUNELI_APP
   (COD_APP, TXT_NAME, COD_STATE, DAT_BEGIN)
 Values
   (1, 'JSON SAYS', 1, TO_DATE('06/01/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into BUNELI_APP
   (COD_APP, TXT_NAME, COD_STATE, DAT_BEGIN)
 Values
   (2, 'UTILAPP', 1, TO_DATE('06/01/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into BUNELI_APP
   (COD_APP, TXT_NAME, COD_STATE, DAT_BEGIN)
 Values
   (3, 'ACCOUNT', 1, TO_DATE('06/01/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
COMMIT;
END;


--MYSQL
BEGIN
insert into buneli_app values (1, 'JSON SAYS', 1, '06/01/2012',null);
insert into buneli_app values (2, 'UTILAPP', 1, '06/01/2012',null);
insert into buneli_app values (3, 'ACCOUNT', 1, '06/01/2012',null);
COMMIT;
END;

--ORACLE
BEGIN
Insert into BUNELI_STATE
   (COD_STATE, TXT_STATE)
 Values
   (1, 'ACTIVE');
Insert into BUNELI_STATE
   (COD_STATE, TXT_STATE)
 Values
   (2, 'INACTIVE');
COMMIT;
END;

--MYSQL
BEGIN
insert into buneli_state  values (1, 'ACTIVE');
insert into buneli_state values (2, 'INACTIVE');
COMMIT;
END;

--

--
-- Dumping data for table 'buneli_country'
--
BEGIN
INSERT INTO buneli_country VALUES('AF', 'AFGHANISTAN');
INSERT INTO buneli_country VALUES('AX', 'ALAND ISLANDS');
INSERT INTO buneli_country VALUES('AL', 'ALBANIA');
INSERT INTO buneli_country VALUES('DZ', 'ALGERIA');
INSERT INTO buneli_country VALUES('AS', 'AMERICAN SAMOA');
INSERT INTO buneli_country VALUES('AD', 'ANDORRA');
INSERT INTO buneli_country VALUES('AO', 'ANGOLA');
INSERT INTO buneli_country VALUES('AI', 'ANGUILLA');
INSERT INTO buneli_country VALUES('AQ', 'ANTARCTICA');
INSERT INTO buneli_country VALUES('AG', 'ANTIGUA AND BARBUDA');
INSERT INTO buneli_country VALUES('AR', 'ARGENTINA');
INSERT INTO buneli_country VALUES('AM', 'ARMENIA');
INSERT INTO buneli_country VALUES('AW', 'ARUBA');
INSERT INTO buneli_country VALUES('AU', 'AUSTRALIA');
INSERT INTO buneli_country VALUES('AT', 'AUSTRIA');
INSERT INTO buneli_country VALUES('AZ', 'AZERBAIJAN');
INSERT INTO buneli_country VALUES('BS', 'BAHAMAS');
INSERT INTO buneli_country VALUES('BH', 'BAHRAIN');
INSERT INTO buneli_country VALUES('BD', 'BANGLADESH');
INSERT INTO buneli_country VALUES('BB', 'BARBADOS');
INSERT INTO buneli_country VALUES('BY', 'BELARUS');
INSERT INTO buneli_country VALUES('BE', 'BELGIUM');
INSERT INTO buneli_country VALUES('BZ', 'BELIZE');
INSERT INTO buneli_country VALUES('BJ', 'BENIN');
INSERT INTO buneli_country VALUES('BM', 'BERMUDA');
INSERT INTO buneli_country VALUES('BT', 'BHUTAN');
INSERT INTO buneli_country VALUES('BO', 'BOLIVIA, PLURINATIONAL STATE OF');
INSERT INTO buneli_country VALUES('BQ', 'BONAIRE, SINT EUSTATIUS AND SABA');
INSERT INTO buneli_country VALUES('BA', 'BOSNIA AND HERZEGOVINA');
INSERT INTO buneli_country VALUES('BW', 'BOTSWANA');
INSERT INTO buneli_country VALUES('BV', 'BOUVET ISLAND');
INSERT INTO buneli_country VALUES('BR', 'BRAZIL');
INSERT INTO buneli_country VALUES('IO', 'BRITISH INDIAN OCEAN TERRITORY');
INSERT INTO buneli_country VALUES('BN', 'BRUNEI DARUSSALAM');
INSERT INTO buneli_country VALUES('BG', 'BULGARIA');
INSERT INTO buneli_country VALUES('BF', 'BURKINA FASO');
INSERT INTO buneli_country VALUES('BI', 'BURUNDI');
INSERT INTO buneli_country VALUES('KH', 'CAMBODIA');
INSERT INTO buneli_country VALUES('CM', 'CAMEROON');
INSERT INTO buneli_country VALUES('CA', 'CANADA');
INSERT INTO buneli_country VALUES('CV', 'CAPE VERDE');
INSERT INTO buneli_country VALUES('KY', 'CAYMAN ISLANDS');
INSERT INTO buneli_country VALUES('CF', 'CENTRAL AFRICAN REPUBLIC');
INSERT INTO buneli_country VALUES('TD', 'CHAD');
INSERT INTO buneli_country VALUES('CL', 'CHILE');
INSERT INTO buneli_country VALUES('CN', 'CHINA');
INSERT INTO buneli_country VALUES('CX', 'CHRISTMAS ISLAND');
INSERT INTO buneli_country VALUES('CC', 'COCOS (KEELING) ISLANDS');
INSERT INTO buneli_country VALUES('CO', 'COLOMBIA');
INSERT INTO buneli_country VALUES('KM', 'COMOROS');
INSERT INTO buneli_country VALUES('CG', 'CONGO');
INSERT INTO buneli_country VALUES('CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE');
INSERT INTO buneli_country VALUES('CK', 'COOK ISLANDS');
INSERT INTO buneli_country VALUES('CR', 'COSTA RICA');
INSERT INTO buneli_country VALUES('CI', 'COTE D''IVOIRE');
INSERT INTO buneli_country VALUES('HR', 'CROATIA');
INSERT INTO buneli_country VALUES('CU', 'CUBA');
INSERT INTO buneli_country VALUES('CW', 'CURA');
INSERT INTO buneli_country VALUES('CY', 'CYPRUS');
INSERT INTO buneli_country VALUES('CZ', 'CZECH REPUBLIC');
INSERT INTO buneli_country VALUES('DK', 'DENMARK');
INSERT INTO buneli_country VALUES('DJ', 'DJIBOUTI');
INSERT INTO buneli_country VALUES('DM', 'DOMINICA');
INSERT INTO buneli_country VALUES('DO', 'DOMINICAN REPUBLIC');
INSERT INTO buneli_country VALUES('EC', 'ECUADOR');
INSERT INTO buneli_country VALUES('EG', 'EGYPT');
INSERT INTO buneli_country VALUES('SV', 'EL SALVADOR');
INSERT INTO buneli_country VALUES('GQ', 'EQUATORIAL GUINEA');
INSERT INTO buneli_country VALUES('ER', 'ERITREA');
INSERT INTO buneli_country VALUES('EE', 'ESTONIA');
INSERT INTO buneli_country VALUES('ET', 'ETHIOPIA');
INSERT INTO buneli_country VALUES('FK', 'FALKLAND ISLANDS (MALVINAS)');
INSERT INTO buneli_country VALUES('FO', 'FAROE ISLANDS');
INSERT INTO buneli_country VALUES('FJ', 'FIJI');
INSERT INTO buneli_country VALUES('FI', 'FINLAND');
INSERT INTO buneli_country VALUES('FR', 'FRANCE');
INSERT INTO buneli_country VALUES('GF', 'FRENCH GUIANA');
INSERT INTO buneli_country VALUES('PF', 'FRENCH POLYNESIA');
INSERT INTO buneli_country VALUES('TF', 'FRENCH SOUTHERN TERRITORIES');
INSERT INTO buneli_country VALUES('GA', 'GABON');
INSERT INTO buneli_country VALUES('GM', 'GAMBIA');
INSERT INTO buneli_country VALUES('GE', 'GEORGIA');
INSERT INTO buneli_country VALUES('DE', 'GERMANY');
INSERT INTO buneli_country VALUES('GH', 'GHANA');
INSERT INTO buneli_country VALUES('GI', 'GIBRALTAR');
INSERT INTO buneli_country VALUES('GR', 'GREECE');
INSERT INTO buneli_country VALUES('GL', 'GREENLAND');
INSERT INTO buneli_country VALUES('GD', 'GRENADA');
INSERT INTO buneli_country VALUES('GP', 'GUADELOUPE');
INSERT INTO buneli_country VALUES('GU', 'GUAM');
INSERT INTO buneli_country VALUES('GT', 'GUATEMALA');
INSERT INTO buneli_country VALUES('GG', 'GUERNSEY');
INSERT INTO buneli_country VALUES('GN', 'GUINEA');
INSERT INTO buneli_country VALUES('GW', 'GUINEA-BISSAU');
INSERT INTO buneli_country VALUES('GY', 'GUYANA');
INSERT INTO buneli_country VALUES('HT', 'HAITI');
INSERT INTO buneli_country VALUES('HM', 'HEARD ISLAND AND MCDONALD ISLANDS');
INSERT INTO buneli_country VALUES('VA', 'HOLY SEE (VATICAN CITY STATE)');
INSERT INTO buneli_country VALUES('HN', 'HONDURAS');
INSERT INTO buneli_country VALUES('HK', 'HONG KONG');
INSERT INTO buneli_country VALUES('HU', 'HUNGARY');
INSERT INTO buneli_country VALUES('IS', 'ICELAND');
INSERT INTO buneli_country VALUES('IN', 'INDIA');
INSERT INTO buneli_country VALUES('ID', 'INDONESIA');
INSERT INTO buneli_country VALUES('IR', 'IRAN, ISLAMIC REPUBLIC OF');
INSERT INTO buneli_country VALUES('IQ', 'IRAQ');
INSERT INTO buneli_country VALUES('IE', 'IRELAND');
INSERT INTO buneli_country VALUES('IM', 'ISLE OF MAN');
INSERT INTO buneli_country VALUES('IL', 'ISRAEL');
INSERT INTO buneli_country VALUES('IT', 'ITALY');
INSERT INTO buneli_country VALUES('JM', 'JAMAICA');
INSERT INTO buneli_country VALUES('JP', 'JAPAN');
INSERT INTO buneli_country VALUES('JE', 'JERSEY');
INSERT INTO buneli_country VALUES('JO', 'JORDAN');
INSERT INTO buneli_country VALUES('KZ', 'KAZAKHSTAN');
INSERT INTO buneli_country VALUES('KE', 'KENYA');
INSERT INTO buneli_country VALUES('KI', 'KIRIBATI');
INSERT INTO buneli_country VALUES('KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF');
INSERT INTO buneli_country VALUES('KR', 'KOREA, REPUBLIC OF');
INSERT INTO buneli_country VALUES('KW', 'KUWAIT');
INSERT INTO buneli_country VALUES('KG', 'KYRGYZSTAN');
INSERT INTO buneli_country VALUES('LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC');
INSERT INTO buneli_country VALUES('LV', 'LATVIA');
INSERT INTO buneli_country VALUES('LB', 'LEBANON');
INSERT INTO buneli_country VALUES('LS', 'LESOTHO');
INSERT INTO buneli_country VALUES('LR', 'LIBERIA');
INSERT INTO buneli_country VALUES('LY', 'LIBYA');
INSERT INTO buneli_country VALUES('LI', 'LIECHTENSTEIN');
INSERT INTO buneli_country VALUES('LT', 'LITHUANIA');
INSERT INTO buneli_country VALUES('LU', 'LUXEMBOURG');
INSERT INTO buneli_country VALUES('MO', 'MACAO');
INSERT INTO buneli_country VALUES('MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF');
INSERT INTO buneli_country VALUES('MG', 'MADAGASCAR');
INSERT INTO buneli_country VALUES('MW', 'MALAWI');
INSERT INTO buneli_country VALUES('MY', 'MALAYSIA');
INSERT INTO buneli_country VALUES('MV', 'MALDIVES');
INSERT INTO buneli_country VALUES('ML', 'MALI');
INSERT INTO buneli_country VALUES('MT', 'MALTA');
INSERT INTO buneli_country VALUES('MH', 'MARSHALL ISLANDS');
INSERT INTO buneli_country VALUES('MQ', 'MARTINIQUE');
INSERT INTO buneli_country VALUES('MR', 'MAURITANIA');
INSERT INTO buneli_country VALUES('MU', 'MAURITIUS');
INSERT INTO buneli_country VALUES('YT', 'MAYOTTE');
INSERT INTO buneli_country VALUES('MX', 'MEXICO');
INSERT INTO buneli_country VALUES('FM', 'MICRONESIA, FEDERATED STATES OF');
INSERT INTO buneli_country VALUES('MD', 'MOLDOVA, REPUBLIC OF');
INSERT INTO buneli_country VALUES('MC', 'MONACO');
INSERT INTO buneli_country VALUES('MN', 'MONGOLIA');
INSERT INTO buneli_country VALUES('ME', 'MONTENEGRO');
INSERT INTO buneli_country VALUES('MS', 'MONTSERRAT');
INSERT INTO buneli_country VALUES('MA', 'MOROCCO');
INSERT INTO buneli_country VALUES('MZ', 'MOZAMBIQUE');
INSERT INTO buneli_country VALUES('MM', 'MYANMAR');
INSERT INTO buneli_country VALUES('NA', 'NAMIBIA');
INSERT INTO buneli_country VALUES('NR', 'NAURU');
INSERT INTO buneli_country VALUES('NP', 'NEPAL');
INSERT INTO buneli_country VALUES('NL', 'NETHERLANDS');
INSERT INTO buneli_country VALUES('NC', 'NEW CALEDONIA');
INSERT INTO buneli_country VALUES('NZ', 'NEW ZEALAND');
INSERT INTO buneli_country VALUES('NI', 'NICARAGUA');
INSERT INTO buneli_country VALUES('NE', 'NIGER');
INSERT INTO buneli_country VALUES('NG', 'NIGERIA');
INSERT INTO buneli_country VALUES('NU', 'NIUE');
INSERT INTO buneli_country VALUES('NF', 'NORFOLK ISLAND');
INSERT INTO buneli_country VALUES('MP', 'NORTHERN MARIANA ISLANDS');
INSERT INTO buneli_country VALUES('NO', 'NORWAY');
INSERT INTO buneli_country VALUES('OM', 'OMAN');
INSERT INTO buneli_country VALUES('PK', 'PAKISTAN');
INSERT INTO buneli_country VALUES('PW', 'PALAU');
INSERT INTO buneli_country VALUES('PS', 'PALESTINIAN TERRITORY, OCCUPIED');
INSERT INTO buneli_country VALUES('PA', 'PANAMA');
INSERT INTO buneli_country VALUES('PG', 'PAPUA NEW GUINEA');
INSERT INTO buneli_country VALUES('PY', 'PARAGUAY');
INSERT INTO buneli_country VALUES('PE', 'PERU');
INSERT INTO buneli_country VALUES('PH', 'PHILIPPINES');
INSERT INTO buneli_country VALUES('PN', 'PITCAIRN');
INSERT INTO buneli_country VALUES('PL', 'POLAND');
INSERT INTO buneli_country VALUES('PT', 'PORTUGAL');
INSERT INTO buneli_country VALUES('PR', 'PUERTO RICO');
INSERT INTO buneli_country VALUES('QA', 'QATAR');
INSERT INTO buneli_country VALUES('RE', 'REUNION');
INSERT INTO buneli_country VALUES('RO', 'ROMANIA');
INSERT INTO buneli_country VALUES('RU', 'RUSSIAN FEDERATION');
INSERT INTO buneli_country VALUES('RW', 'RWANDA');
INSERT INTO buneli_country VALUES('BL', 'SAINT BARTH');
INSERT INTO buneli_country VALUES('SH', 'SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA');
INSERT INTO buneli_country VALUES('KN', 'SAINT KITTS AND NEVIS');
INSERT INTO buneli_country VALUES('LC', 'SAINT LUCIA');
INSERT INTO buneli_country VALUES('MF', 'SAINT MARTIN (FRENCH PART)');
INSERT INTO buneli_country VALUES('PM', 'SAINT PIERRE AND MIQUELON');
INSERT INTO buneli_country VALUES('VC', 'SAINT VINCENT AND THE GRENADINES');
INSERT INTO buneli_country VALUES('WS', 'SAMOA');
INSERT INTO buneli_country VALUES('SM', 'SAN MARINO');
INSERT INTO buneli_country VALUES('ST', 'SAO TOME AND PRINCIPE');
INSERT INTO buneli_country VALUES('SA', 'SAUDI ARABIA');
INSERT INTO buneli_country VALUES('SN', 'SENEGAL');
INSERT INTO buneli_country VALUES('RS', 'SERBIA');
INSERT INTO buneli_country VALUES('SC', 'SEYCHELLES');
INSERT INTO buneli_country VALUES('SL', 'SIERRA LEONE');
INSERT INTO buneli_country VALUES('SG', 'SINGAPORE');
INSERT INTO buneli_country VALUES('SX', 'SINT MAARTEN (DUTCH PART)');
INSERT INTO buneli_country VALUES('SK', 'SLOVAKIA');
INSERT INTO buneli_country VALUES('SI', 'SLOVENIA');
INSERT INTO buneli_country VALUES('SB', 'SOLOMON ISLANDS');
INSERT INTO buneli_country VALUES('SO', 'SOMALIA');
INSERT INTO buneli_country VALUES('ZA', 'SOUTH AFRICA');
INSERT INTO buneli_country VALUES('GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS');
INSERT INTO buneli_country VALUES('SS', 'SOUTH SUDAN');
INSERT INTO buneli_country VALUES('ES', 'SPAIN');
INSERT INTO buneli_country VALUES('LK', 'SRI LANKA');
INSERT INTO buneli_country VALUES('SD', 'SUDAN');
INSERT INTO buneli_country VALUES('SR', 'SURINAME');
INSERT INTO buneli_country VALUES('SJ', 'SVALBARD AND JAN MAYEN');
INSERT INTO buneli_country VALUES('SZ', 'SWAZILAND');
INSERT INTO buneli_country VALUES('SE', 'SWEDEN');
INSERT INTO buneli_country VALUES('CH', 'SWITZERLAND');
INSERT INTO buneli_country VALUES('SY', 'SYRIAN ARAB REPUBLIC');
INSERT INTO buneli_country VALUES('TW', 'TAIWAN, PROVINCE OF CHINA');
INSERT INTO buneli_country VALUES('TJ', 'TAJIKISTAN');
INSERT INTO buneli_country VALUES('TZ', 'TANZANIA, UNITED REPUBLIC OF');
INSERT INTO buneli_country VALUES('TH', 'THAILAND');
INSERT INTO buneli_country VALUES('TL', 'TIMOR-LESTE');
INSERT INTO buneli_country VALUES('TG', 'TOGO');
INSERT INTO buneli_country VALUES('TK', 'TOKELAU');
INSERT INTO buneli_country VALUES('TO', 'TONGA');
INSERT INTO buneli_country VALUES('TT', 'TRINIDAD AND TOBAGO');
INSERT INTO buneli_country VALUES('TN', 'TUNISIA');
INSERT INTO buneli_country VALUES('TR', 'TURKEY');
INSERT INTO buneli_country VALUES('TM', 'TURKMENISTAN');
INSERT INTO buneli_country VALUES('TC', 'TURKS AND CAICOS ISLANDS');
INSERT INTO buneli_country VALUES('TV', 'TUVALU');
INSERT INTO buneli_country VALUES('UG', 'UGANDA');
INSERT INTO buneli_country VALUES('UA', 'UKRAINE');
INSERT INTO buneli_country VALUES('AE', 'UNITED ARAB EMIRATES');
INSERT INTO buneli_country VALUES('GB', 'UNITED KINGDOM');
INSERT INTO buneli_country VALUES('US', 'UNITED STATES');
INSERT INTO buneli_country VALUES('UM', 'UNITED STATES MINOR OUTLYING ISLANDS');
INSERT INTO buneli_country VALUES('UY', 'URUGUAY');
INSERT INTO buneli_country VALUES('UZ', 'UZBEKISTAN');
INSERT INTO buneli_country VALUES('VU', 'VANUATU');
INSERT INTO buneli_country VALUES('VE', 'VENEZUELA, BOLIVARIAN REPUBLIC OF');
INSERT INTO buneli_country VALUES('VN', 'VIET NAM');
INSERT INTO buneli_country VALUES('VG', 'VIRGIN ISLANDS, BRITISH');
INSERT INTO buneli_country VALUES('VI', 'VIRGIN ISLANDS, U.S.');
INSERT INTO buneli_country VALUES('WF', 'WALLIS AND FUTUNA');
INSERT INTO buneli_country VALUES('EH', 'WESTERN SAHARA');
INSERT INTO buneli_country VALUES('YE', 'YEMEN');
INSERT INTO buneli_country VALUES('ZM', 'ZAMBIA');
INSERT INTO buneli_country VALUES('ZW', 'ZIMBABWE');
COMMIT;
END;


/*
--- OPTIOS
*/

Insert into BUNELI_OPTION
   (COD_APP, COD_OPTION, TXT_OPTION, URL_VALIDATE, URL_EXECUTE)
 Values
   (1, 1, 'VALIDATE LOGIN', '../../buneli/php/admin/validate_login.php', '../../');
Insert into BUNELI_OPTION
   (COD_APP, COD_OPTION, TXT_OPTION)
 Values
   (1, 2, 'SIGN OUT');
Insert into BUNELI_OPTION
   (COD_APP, COD_OPTION, TXT_OPTION, URL_DRAW)
 Values
   (1, 3, 'MANAGE YOU ACCOUNT', 'showUserData.php');
Insert into BUNELI_OPTION
   (COD_APP, COD_OPTION, TXT_OPTION, URL_DRAW)
 Values
   (1, 4, 'USERS', 'showUsers.php');
Insert into BUNELI_OPTION
   (COD_APP, COD_OPTION, TXT_OPTION, URL_DRAW, OPT_MENU, POP_UP)
 Values
   (1, 5, 'DIFFUSE A MESSAGE', 
    'showDiffusingWindow.php', 1, 1);
COMMIT;

------ 

Insert into BUNELI_MESSAGES
   (COD_APP, COD_MESSAGE, COD_LANGUAGE, TXT_MESSAGE)
 Values
   (1, 'opt_not_found', 'esp', 'Option nof found, contact the service Administrator');
Insert into BUNELI_MESSAGES
   (COD_APP, COD_MESSAGE, COD_LANGUAGE, TXT_MESSAGE)
 Values
   (1, 'opt_not_found', 'eng', 'Opcion no encontrada, contacte el administrador del sistema');
Insert into BUNELI_MESSAGES
   (COD_APP, COD_MESSAGE, COD_LANGUAGE, TXT_MESSAGE)
 Values
   (1, 'login_data_miss', 'eng', 'Both fields, user and pass must be filled');
Insert into BUNELI_MESSAGES
   (COD_APP, COD_MESSAGE, COD_LANGUAGE, TXT_MESSAGE)
 Values
   (1, 'login_data_miss', 'esp', 'Ambos Campos, usuario y password beden ser diligenciados');
Insert into BUNELI_MESSAGES
   (COD_APP, COD_MESSAGE, COD_LANGUAGE, TXT_MESSAGE)
 Values
   (1, 'empty_option', 'eng', 'There are not settings stablished for this action');
Insert into BUNELI_MESSAGES
   (COD_APP, COD_MESSAGE, COD_LANGUAGE, TXT_MESSAGE)
 Values
   (1, 'empty_option', 'esp', 'La opcion no tiene ninguna configuracion establecida');
Insert into BUNELI_MESSAGES
   (COD_APP, COD_MESSAGE, COD_LANGUAGE, TXT_MESSAGE)
 Values
   (1, 'div_master_ad', 'eng', 'The div_master div object is required.');
Insert into BUNELI_MESSAGES
   (COD_APP, COD_MESSAGE, COD_LANGUAGE, TXT_MESSAGE)
 Values
   (1, 'frm_error', 'eng', 'Both Forms, main and aux, must be declared');
Insert into BUNELI_MESSAGES
   (COD_APP, COD_MESSAGE, COD_LANGUAGE, TXT_MESSAGE)
 Values
   (1, 'div_master_ad', 'esp', 'El div div_master es requerido');
Insert into BUNELI_MESSAGES
   (COD_APP, COD_MESSAGE, COD_LANGUAGE, TXT_MESSAGE)
 Values
   (1, 'frm_error', 'esp', 'Ambas Formas, main y aux, deben ser declaradas');
COMMIT;




----
Insert into buneli_languages
   (COD_LANGUAGE, TXT_LANGUAGE)
 Values
   ('esp', 'Spanish');
Insert into buneli_languages
   (COD_LANGUAGE, TXT_LANGUAGE)
 Values
   ('eng', 'English');
   
COMMIT;



insert into buneli_option_dictionary
   (txt_option, cod_language, txt_translation)
 values
   ('VALIDATE LOGIN', 'esp', 'VALIDAR INICIO DE SESION');
   
insert into buneli_option_dictionary
   (txt_option, cod_language, txt_translation)
 values
   ('SIGN OUT', 'esp', 'CERRAR SESION');
   
insert into buneli_option_dictionary
   (txt_option, cod_language, txt_translation)
 values
   ('MANAGE YOU ACCOUNT', 'esp', 'ADMINISTRAR CUENTA');
   
insert into buneli_option_dictionary
   (txt_option, cod_language, txt_translation)
 values
   ('USERS', 'esp', 'USUARIOS');
   
insert into buneli_option_dictionary
   (txt_option, cod_language, txt_translation)
 values
   ('DIFFUSE A MESSAGE', 'esp', 'DIFUNDIR UN MENSAJE');
   
COMMIT;
