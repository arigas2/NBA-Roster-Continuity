library(tidyverse)
library(data.table)
library(rvest)


nba.url <- "https://www.basketball-reference.com/friv/continuity.html"

nba.data <- nba.url %>%
  read_html() %>%
  html_nodes("table") %>%     #What type of HTML object are you looking for
  .[[1]] %>%
  html_table()

long.nba <- nba.data %>%
  gather(key = "Team", value = "Roster Continuity", -Season)

long.nba$`Roster Continuity` <- str_replace_all(long.nba$`Roster Continuity`, "%", "")
long.nba$`Roster Continuity` <- as.numeric(na.omit(long.nba$`Roster Continuity`))
long.nba$`Roster Continuity` <- long.nba$`Roster Continuity`/100
long.nba[433,3] <- 1

write.csv(x = long.nba, file = "nbaRosterContinuity.csv")

nba.records <- read.csv(file = "HistoricalNBAPerformance.csv")
nba.records <- nba.records[,1:4]
colnames(nba.records)[1] <- "Season"
nba.records2 <- read.csv(file = "Team_Records.csv")

additional.stats <- read.csv("Team_Records.csv")
colnames(additional.stats)[1] <- "Season"
additional.stats$Team <- str_replace_all(additional.stats$Team, "[*]", "")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Boston Celtics", "BOS")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Atlanta Hawks", "ATL")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Tri-Cities Blackhawks", "ATL")
additional.stats$Team <- str_replace_all(additional.stats$Team, "St. Louis Hawks", "ATL")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Milwaukee Hawks", "ATL")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Charlotte Bobcats", "CHA")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Charlotte Hornets", "CHA")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Chicago Bulls", "CHI")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Cleveland Cavaliers", "CLE")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Dallas Mavericks", "DAL")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Denver Nuggets", "DEN")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Detroit Pistons", "DET")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Fort Wayne Pistons", "DET")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Denver Nuggets", "DEN")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Denver Rockets", "DEN")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Golden State Warriors", "GSW")
additional.stats$Team <- str_replace_all(additional.stats$Team, "San Francisco Warriors", "GSW")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Philadelphia Warriors", "GSW")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Houston Rockets", "HOU")
additional.stats$Team <- str_replace_all(additional.stats$Team, "San Diego Rockets", "HOU")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Indiana Pacers", "IND")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Los Angeles Clippers", "LAC")
additional.stats$Team <- str_replace_all(additional.stats$Team, "San Diego Clippers", "LAC")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Buffalo Braves", "LAC")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Los Angeles Lakers", "LAL")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Minneapolis Lakers", "LAL")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Memphis Grizzlies", "MEM")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Vancouver Grizzlies", "MEM")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Miami Heat", "MIA")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Milwaukee Bucks", "MIL")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Minnesota Timberwolves", "MIN")
additional.stats$Team <- str_replace_all(additional.stats$Team, "New York Knicks", "NYK")
additional.stats$Team <- str_replace_all(additional.stats$Team, "New Jersey Nets", "NJN")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Brooklyn Nets", "NJN")
additional.stats$Team <- str_replace_all(additional.stats$Team, "New York Nets", "NJN")
additional.stats$Team <- str_replace_all(additional.stats$Team, "New Jersey Americans", "NJN")
additional.stats$Team <- str_replace_all(additional.stats$Team, "New Orleans Pelicans", "NOH")
additional.stats$Team <- str_replace_all(additional.stats$Team, "New Orleans Hornets", "NOH")
additional.stats$Team <- str_replace_all(additional.stats$Team, "New Orleans/Oklahoma City Hornets", "NOH")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Oklahoma City Thunder", "OKC")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Seattle SuperSonics", "OKC")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Orlando Magic", "ORL")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Philadelphia 76ers", "PHI")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Syracuse Nationals", "PHI")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Phoenix Suns", "PHO")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Portland Trail Blazers", "POR")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Sacramento Kings", "SAC")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Kansas City Kings", "SAC")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Kansas City-Omaha Kings", "SAC")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Cincinnati Royals", "SAC")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Rochester Royals", "SAC")
additional.stats$Team <- str_replace_all(additional.stats$Team, "San Antonio Spurs", "SAS")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Dallas Chaparrals", "SAS")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Texas Chaparrals", "SAS")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Toronto Raptors", "TOR")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Utah Jazz", "UTA")
additional.stats$Team <- str_replace_all(additional.stats$Team, "New Orleans Jazz", "UTA")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Washington Wizards", "WAS")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Washington Bullets", "WAS")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Capital Bullets", "WAS")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Baltimore Bullets", "WAS")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Chicago Zephyrs", "WAS")
additional.stats$Team <- str_replace_all(additional.stats$Team, "Chicago Packers", "WAS")

long.nba$Season <- as.character(long.nba$Season)
long.nba$Season <- as.Date(long.nba$Season, "%Y")
additional.stats$Season <- as.character(additional.stats$Season)
additional.stats$Season <- as.Date(additional.stats$Season, "%Y")

nba2 <- right_join(long.nba, additional.stats, by = c("Season", "Team"))


nba2$Season <- as.character(nba2$Season)
nba2$Season <- as.Date(nba2$Season, "%Y")
nba2$Season <- format(nba2$Season, "%Y")


teams <- unique(nba2[,2])

WPR <- NULL

for (i in 1:30) {
  toy <- nba2 %>%
    filter(Team == teams[i])
  for (j in 1:nrow(toy)-1){
    WPR <- append(WPR, toy[j,5] / toy[j+1,5])
  }
  WPR <- append(WPR, NA)
}

nba2$Winning.Percentage.ratio <- WPR
colnames(nba2)[7] <- "WP"


write.csv(x = nba2, file = "nbahistoricalwrostercontinuity.csv")


nba.records$Team <- str_replace_all(nba.records$Team, "Celtics", "BOS")
nba.records$Team <- str_replace_all(nba.records$Team, "Hawks", "ATL")
nba.records$Team <- str_replace_all(nba.records$Team, "Bobcats", "CHA")
nba.records$Team <- str_replace_all(nba.records$Team, "Bulls", "CHI")
nba.records$Team <- str_replace_all(nba.records$Team, "Cavaliers", "CLE")
nba.records$Team <- str_replace_all(nba.records$Team, "Mavericks", "DAL")
nba.records$Team <- str_replace_all(nba.records$Team, "Nuggets", "DEN")
nba.records$Team <- str_replace_all(nba.records$Team, "Pistons", "DET")
nba.records$Team <- str_replace_all(nba.records$Team, "Nuggets", "DEN")
nba.records$Team <- str_replace_all(nba.records$Team, "Warriors", "GSW")
nba.records$Team <- str_replace_all(nba.records$Team, "Rockets", "HOU")
nba.records$Team <- str_replace_all(nba.records$Team, "Pacers", "IND")
nba.records$Team <- str_replace_all(nba.records$Team, "Nuggets", "DEN")
nba.records$Team <- str_replace_all(nba.records$Team, "Clippers", "LAC")
nba.records$Team <- str_replace_all(nba.records$Team, "Braves", "LAC")
nba.records$Team <- str_replace_all(nba.records$Team, "Lakers", "LAL")
nba.records$Team <- str_replace_all(nba.records$Team, "Grizzlies", "MEM")
nba.records$Team <- str_replace_all(nba.records$Team, "Heat", "MIA")
nba.records$Team <- str_replace_all(nba.records$Team, "Bucks", "MIL")
nba.records$Team <- str_replace_all(nba.records$Team, "Timberwolves", "MIN")
nba.records$Team <- str_replace_all(nba.records$Team, "Knicks", "NYK")
nba.records$Team <- str_replace_all(nba.records$Team, "Nets", "NJN")
nba.records$Team <- str_replace_all(nba.records$Team, "Pelicans", "NOH")
nba.records$Team <- str_replace_all(nba.records$Team, "Thunder", "OKC")
nba.records$Team <- str_replace_all(nba.records$Team, "Supersonics", "OKC")
nba.records$Team <- str_replace_all(nba.records$Team, "Magic", "ORL")
nba.records$Team <- str_replace_all(nba.records$Team, "76ers", "PHI")
nba.records$Team <- str_replace_all(nba.records$Team, "Nationals", "PHI")
nba.records$Team <- str_replace_all(nba.records$Team, "Suns", "PHO")
nba.records$Team <- str_replace_all(nba.records$Team, "Trail Blazers", "POR")
nba.records$Team <- str_replace_all(nba.records$Team, "Kings", "SAC")
nba.records$Team <- str_replace_all(nba.records$Team, "Royals", "SAC")
nba.records$Team <- str_replace_all(nba.records$Team, "Spurs", "SAS")
nba.records$Team <- str_replace_all(nba.records$Team, "Raptors", "TOR")
nba.records$Team <- str_replace_all(nba.records$Team, "Jazz", "UTA")
nba.records$Team <- str_replace_all(nba.records$Team, "Wizards", "WAS")
nba.records$Team <- str_replace_all(nba.records$Team, "Bullets", "WAS")
nba.records$Team <- str_replace_all(nba.records$Team, "Zephyrs", "WAS")
nba.records$Team <- str_replace_all(nba.records$Team, "Packers", "WAS")

for (i in 863:873) {
  nba.records$Team[i] <- str_replace(nba.records$Team[i], "Hornets", "NOH")
}

for (i in 181:183) {
  nba.records$Team[i] <- str_replace(nba.records$Team[i], "Hornets", "CHA")
}

for (i in 194:207) {
  nba.records$Team[i] <- str_replace(nba.records$Team[i], "Hornets", "CHA")
}

nba.records$Season <- str_replace_all(nba.records$Season, "[*]", "")

nba.records$Season <- as.character(nba.records$Season)
nba.records$Season <- as.Date(nba.records$Season, "%Y")
long.nba$Season <- as.character(long.nba$Season)
long.nba$Season <- as.Date(long.nba$Season, "%Y")

new.nba <- inner_join(long.nba, nba.records, by = c("Season", "Team"))

new.nba$Season <- as.character(new.nba$Season)
new.nba$Season <- as.Date(new.nba$Season, "%Y")
new.nba$Season <- format(new.nba$Season, "%Y")


new.nba <- na.omit(new.nba)

teams <- unique(new.nba[,2])

WPR <- NULL

for (i in 1:30) {
    toy <- new.nba %>%
      filter(Team == teams[i])
    for (j in 1:nrow(toy)-1){
      WPR <- append(WPR, toy[j,5] / toy[j+1,5])
    }
    WPR <- append(WPR, NA)
}

new.nba$WinningPercentage.ratio <- WPR



write.csv(x = new.nba, file = "nbaRosterContinuitywRegularSeasonRecords.csv")
