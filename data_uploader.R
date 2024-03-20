library(data.table)

master_data = fread("LL_history.csv")

new_data = fread("LL100_Leaguewide_MD25.csv")

new_data[, Level := substr(Rundle, 1, 1)]
new_data[, Rundle := substr(Rundle, 3, length(Rundle))]
new_data[, Season_League := sapply(strsplit(Rundle, " "), "[[", 1)]

new_data = new_data[, -c('Matchday', 'PCA', 'QPO', 'QPD', 'OPD', '3PT', 'Branch')]

master_data = rbindlist(list(master_data, new_data), use.names = TRUE)

fwrite(master_data, "LL_history.csv")
