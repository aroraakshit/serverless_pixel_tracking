/* Without UDF */
SELECT
  timestamp,
  REGEXP_EXTRACT(httpRequest.requestUrl, r"^.+SECRET=([a-zA-Z0-9_]*)") as SECRET,
  REGEXP_EXTRACT(httpRequest.requestUrl, r"^.+EVENT=([a-zA-Z0-9_]*)") as EVENT,
  REGEXP_EXTRACT(httpRequest.requestUrl, r"^.+RESOLUTION=([0-9]*)") as RESOLUTION
FROM
  `[PROJECT_NAME].[DATASET_NAME].requests_*`
WHERE REGEXP_EXTRACT(httpRequest.requestUrl, r"^.+SECRET=([a-zA-Z0-9_]*)") IS NOT null

/* With UDF */
SELECT 
  timestamp,
  REGEXP_EXTRACT(Decoded_URL, r"^.+SECRET=([^&]*)") as SECRET,
  REGEXP_EXTRACT(Decoded_URL, r"^.+EVENT=([^&]*)") as EVENT,
  REGEXP_EXTRACT(Decoded_URL, r"^.+RESOLUTION=([^&]*)") as RESOLUTION
FROM 
  urldecode(
    SELECT httpRequest.requestUrl, timestamp FROM [[PROJECT_NAME].[DATASET_NAME].requests_19700101]
  )
WHERE
REGEXP_EXTRACT(Decoded_URL, r"^.+SECRET=([^&]*)") IS NOT NULL