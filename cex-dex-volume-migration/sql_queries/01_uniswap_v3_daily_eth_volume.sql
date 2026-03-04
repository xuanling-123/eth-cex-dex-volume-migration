-- SELECT * FROM uniswap_v3_ethereum.trades LIMIT 5

WITH eth_trades AS (
  SELECT
    date_trunc('day', block_time) AS day,
    amount_usd
  FROM uniswap_v3_ethereum.trades
  WHERE block_time >= TIMESTAMP '2025-09-01'
    AND block_time <  TIMESTAMP '2026-03-01'
    AND amount_usd IS NOT NULL
    AND (
      token_bought_address = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
      OR token_sold_address = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
    )
)
SELECT
  day,
  SUM(amount_usd) AS uniswap_eth_volume_usd
FROM eth_trades
GROUP BY 1
ORDER BY 1