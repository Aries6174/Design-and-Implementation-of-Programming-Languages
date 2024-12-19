# paste("Square","Circle", "Triangle")

# paste("Square", "Circle", "Triangle", sep = "+")

# paste0("Square", "Circle", "Triangle")

# shapes <- c("Square","Circle", "Triangle")
# paste("My favorite shape is a", shapes)

# two_cities <- c("best", "worst")
# paste("It was the", two_cities, "of times.")

# paste(shapes, collapse = " ")

# nchar("Supercalifragilisticexpialidocious")

# cases <- c("CAPS", "low", "Title")
# tolower(cases)

# toupper(cases)

# regular_expression <- "a"
# string_to_search <- "Maryland"
# grepl(regular_expression, string_to_search)

# regular_expression <- "u"
# string_to_search <- "Maryland"
# grepl(regular_expression, string_to_search)

# grepl("land", "Maryland")
#
# grepl("ryla", "Maryland")
#
# grepl("Marly", "Maryland")
#
# grepl("dany", "Maryland")

# head(state.name)

# grepl(".", "Maryland")
# 
# grepl(".", "*&2[0+,%<@#~|}")
# 
# grepl(".", "")

# grepl("a.b", c("aaa", "aab", "abb", "acadb"))

# grepl("a+", "Maryland")
# 
# grepl("x+", "Maryland")
# 
# grepl("x*", "Maryland")

# grepl("s{2}", "Mississippi")
# 
# grepl("ss", "Mississippi")
# 
# grepl("s{2,3}", "Mississippi")

# grepl("i{2,3}","Mississippi")
# 
# grepl("(iss){2,3}","Mississippi")
# 
# grepl("(ss){2}","Mississippi")
# 
# grepl("(1.{2}){3}","Mississippi")

# grepl("\\w", "abcdefghijklmnopqrstuvwxyz0123456789")
# 
# grepl("\\d", "0123456789")

# grepl("\\s", "\n\t  ")
# 
# grepl("\\d", "abcdefghijklmnopqrstuvwxyz")
# 
# grepl("\\D", "abcdefghijklmnopqrstuvwxyz")
# 
# grepl("\\w", "\n\t  ")

# grepl("[aeiou]", "rhythms")
# 
# grepl("[^aeiou]", "rhythms")
# 
# grepl("[a-m]", "xyz")
# 
# grepl("[a-m]", "ABC")
# 
# grepl("[a-mA-M]", "ABC")

# grepl("\\+", "tragedy + time = humor")
# 
# grepl("\\.", "http://www.jhsph.edu/")

# grepl("^a", c("bab", "aab"))
# 
# grepl("b$",c("bab", "aab"))
# 
# grepl("^[ab]+$", c("bab", "aab", "abc"))

# grepl("a|b", c("bab", "aab"))
# 
# grepl("North|South", c("South Dakota", "North Carolina", "West Virginia"))

# start_end_vowel <- "^[AEIOU].+[aeiou]{1}$"
# vowel_state_lgl <- grepl(start_end_vowel, state.name)
# head(vowel_state_lgl)
# 
# state.name[vowel_state_lgl]

# grepl("[Ii]", c("Hawaii", "illinois", "Kentucky"))

# grep("[Ii]", c("Hawaii", "illinois", "Kentucky"))

# sub("[Ii]", "1", c("Hawaii", "illinois", "Kentucky"))

# gsub("[Ii]", "1", c("Hawaii", "illinois", "Kentucky"))

# two_s <- state.name[grep("ss", state.name)]
# two_s
# 
# strsplit(two_s, "ss")

# library(stringr)
# 
# state_tbl <- paste(state.name, state.area, state.abb)
# head(state_tbl)
# 
# str_extract(state_tbl, "[0-9]+")

# head(state.name)
# 
# str_order(state.name)
# 
# head(state.abb)
# 
# str_order(state.abb)

# str_pad("Thai", width = 8, side = "left", pad = "-")
# 
# str_pad("Thai", width = 8, side = "right", pad = "-")
# 
# str_pad("Thai", width = 8, side = "both", pad = "-")
# 
# cases <- c("CAPS", "low", "Title")

# str_to_title(cases)

# to_trim <- c("    space", "the    ", "    final frontier  ")
# str_trim(to_trim)

# pasted_states <-paste(state.name[1:20], collapse = " ")
# cat(str_wrap(pasted_states, width=80))
# 
# cat(str_wrap(pasted_states, width = 30))

# a_tale <- "It was the best of times it was the worst of times it was the age of wisdom it was the age of foolishness"
# 
# word(a_tale, 2)
# 
# word(a_tale, end=3)
# 
# word(a_tale, start = 11, end = 15)

# library(pryr)
# mem_used()

# ls()
# 
# object_size(worldcup)

# library(magrittr)
# 
# sapply(ls(), function(x) object_size(get(x))) %>% sort %>% tail(5)

# mem_used()
# 
# rm(ext_tracks, miami)
# mem_used()

# mem_change(rm(check_tracks, denver, b))

# object_size(integer(0))

# object_size(integer(1000))
# 
# object_size(numeric(1000))

# str(.Machine)

# gc()


