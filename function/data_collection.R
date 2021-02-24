# Vale (VALE3)	11,31%
# Itaú (ITUB4)	6,98%
# Petrobras (PETR4)	5,87%
# B3 (B3SA3)	5,42%
# Bradesco (BBDC4)	5,38%
# Petrobras (PETR3)	4,33%
# Ambev (ABEV3)	3,13%
# Magazine Luiza (MGLU3)	3,08%
# Weg (WEGE3)	2,55%
# Itausa (ITSA4)

top_10_ibov <-
  c(
    'VALE3.SA',
    'ITUB4.SA',
    'PETR4.SA',
    'B3SA3.SA',
    'BBDC4.SA',
    'PETR3.SA',
    'ABEV3.SA',
    'MGLU3.SA',
    'WEGE3.SA',
    'ITSA4.SA'
  )

stock_prices_ibov <-
  tidyquant::tq_get(
    top_10_ibov,
    from = '1990-01-01',
    to = '2021-02-24'
  ) %>% 
  dplyr::mutate(
    daily_return = close/lag(close) - 1
  )

readr::write_rds(stock_prices_ibov, 'data/stock_prices_ibov.rds')
