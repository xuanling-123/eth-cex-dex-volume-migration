# eth-cex-dex-volume-migration
Daily ETH spot volume comparison between Binance (CEX) and Uniswap V3 (DEX) to study market-structure shifts across volatility regimes.

ETH Spot Volume Migration
CEX (Binance) vs DEX (Uniswap V3)

## 📖 Overview

This project analyzes daily ETH spot trading volume migration between centralized and decentralized exchanges, specifically:

CEX: Binance Spot (ETHUSDT)
DEX: Uniswap V3 (Ethereum Mainnet)

The goal is to study whether market stress (high volatility) leads to measurable capital migration from centralized exchanges (CEX) to decentralized exchanges (DEX).

## 🎯 Research Question

Does DEX market share increase during high-volatility regimes?
We test whether ETH trading volume shifts toward Uniswap when market volatility spikes.

##📊 Data Sources

1️⃣ Uniswap V3 (DEX)

Source: Dune Analytics
Table: uniswap_v3_ethereum.trades
Filter: Swaps involving WETH
Metric: Daily USD volume

2️⃣ Binance Spot (CEX)

Source: Binance Spot REST API
Endpoint: /api/v3/klines
Symbol: ETHUSDT
Metric: Daily quote asset volume (USDT ≈ USD)

3️⃣ ETH Volatility

Source: Dune price tables
Metric: Daily absolute return
Volatility regime defined as top 20% of daily absolute returns

## 🧠 Methodology
Step 1 — Compute Daily Volumes

- Aggregate Uniswap ETH swap volume (USD)
- Extract Binance daily ETHUSDT volume

Step 2 — Compute DEX Share

<img width="513" height="72" alt="image" src="https://github.com/user-attachments/assets/ec971bad-54e2-40ed-9707-7db4c8a3b3a8" />
​
Step 3 — Define High Volatility Regime

High-volatility days are defined as the top 20% of absolute ETH daily returns.

Step 4 — Statistical Testing

We perform a Welch t-test comparing DEX share between:

- High-volatility days
- Low-volatility days

## 📈 Key Visualization

- 7-day moving average of DEX share
- Highlighted high-volatility days
- Time-series migration dynamics

<img width="1189" height="590" alt="eth_spot_volume_migration" src="https://github.com/user-attachments/assets/be8c0d86-44ee-469e-aeb8-2454c0ed4dcd" />

## 📊 Statistical Result

Welch T-Test:

t-statistic = 1.245  
p-value     = 0.219  
df          ≈ 46.7

## 🔍 Interpretation

- DEX share is higher on high-volatility days
- However, the result is not statistically significant at the 5% level

This suggests:

- Short-term volatility alone does not fully explain capital migration.
- Structural factors or event-driven dynamics may play a larger role.

Notably, a structural increase in DEX share is observed in late-sample periods, indicating potential longer-term market structure shifts rather than purely volatility-driven migration.


## 💡 Key Insight

While volatility correlates directionally with increased DEX participation, the migration effect is not statistically robust in this sample window.

This implies:

Capital migration between CEX and DEX may be influenced more by structural liquidity conditions, exchange-specific factors, or broader ecosystem shifts than by short-term volatility alone.

## 🛠 Tech Stack

- Python
- Pandas
- Matplotlib
- SciPy
- Dune Analytics
- Binance REST API

## ⚠️ Limitations

- Binance volume only (not total CEX volume)
- USDT assumed ≈ USD
- Single-asset focus (ETH only)
- Volatility threshold arbitrarily defined (top 20%)

## 🚀 Why This Matters

Understanding volume migration between centralized and decentralized venues provides insight into:

- Market structure evolution
- Liquidity resilience
- User trust shifts
- Capital allocation dynamics in Web3 ecosystems
