SELECT 
COUNT (DISTINCT
  CONTRATO)
FROM
  `gcp-bia-tmps-vtr-dev-01.gcp_temp_cr_dev_01.2022-01-13_CR_COLLECTIONS_TOTAL_2021-01_A_2021-11_D`
WHERE
  RANGO_CONTRATO ="2-0A30"
  AND TIPO_SERVICIO IN ('INTERNET',
    'CABLE TICA',
    'TELEFONIA',
    'FTTH (JASEC)',
    'HOGARES CONECTADOS')
  AND FECHA_FACTURA ="2021-08-01"
  AND EXTRACT (MONTH
  FROM
    FECHA_ASIGNACION) =9
