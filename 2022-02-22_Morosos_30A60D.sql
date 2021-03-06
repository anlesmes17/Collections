SELECT 
COUNT (DISTINCT
  CONTRATO),
  --FACTURA_ID,COUNT(*),
  CASE
    WHEN (DATE_DIFF(FECHA_PAGO, FECHA_FACTURA, DAY)>= 30 AND DATE_DIFF(FECHA_PAGO, FECHA_FACTURA, DAY)<= 45) THEN "30-45"
    WHEN (DATE_DIFF(FECHA_PAGO, FECHA_FACTURA, DAY)> 45 AND DATE_DIFF(FECHA_PAGO, FECHA_FACTURA, DAY)<= 55) THEN "45-55"
    WHEN (DATE_DIFF(FECHA_PAGO, FECHA_FACTURA, DAY)> 55 AND DATE_DIFF(FECHA_PAGO, FECHA_FACTURA, DAY)<= 60) THEN "55-60"
    --WHEN (DATE_DIFF(FECHA_PAGO, FECHA_FACTURA, DAY)> 60) OR FECHA_PAGO IS NULL THEN "PROX BUCKET"
    END AS RANGO
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
    GROUP BY 2
