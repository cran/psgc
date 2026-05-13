## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment  = "#>"
)
library(psgc)

## ----releases-----------------------------------------------------------------
list_releases()
latest_release()

## ----get-psgc-----------------------------------------------------------------
ph <- get_psgc()
nrow(ph)
head(ph)

## ----filter-region------------------------------------------------------------
regions <- get_psgc(geographic_level = "Region")
regions[, c("psgc_code", "area_name")]

## ----filter-province----------------------------------------------------------
provinces <- get_psgc(geographic_level = "Province")
nrow(provinces)
head(provinces[, c("psgc_code", "area_name")])

## ----filter-multiple----------------------------------------------------------
city_mun <- get_psgc(geographic_level = c("City", "Municipality"))
nrow(city_mun)

## ----filter-city-mun----------------------------------------------------------
nrow(get_psgc(geographic_level = "city_mun"))

## ----older-release------------------------------------------------------------
ph_2023 <- get_psgc("Q1_2023")
nrow(ph_2023)

## ----psgc-info----------------------------------------------------------------
psgc_info("0100000000") # Region I

## ----psgc-info-multi----------------------------------------------------------
psgc_info(c("0100000000", "0102800000"))

## ----psgc-info-short----------------------------------------------------------
psgc_info("01")      # same as "0100000000" — Region I
psgc_info("01028")  # same as "0102800000" — Ilocos Norte

## ----population-basic---------------------------------------------------------
pop <- get_population()
head(pop)

## ----population-details-------------------------------------------------------
pop_detailed <- get_population(details = TRUE)
head(pop_detailed)

## ----population-filter--------------------------------------------------------
region_pop <- get_population(geographic_level = "Region", details = TRUE)
region_pop

## ----population-wide----------------------------------------------------------
region_pop_wide <- get_population(
  geographic_level = "Region",
  details          = TRUE,
  wide             = TRUE
)
region_pop_wide

## ----psgc-pop-nested----------------------------------------------------------
regions_with_pop <- get_psgc(
  geographic_level       = "Region",
  include_population_data = TRUE
)

# Inspect the population data for the first region
regions_with_pop$population_data[[1]]

## ----map-psgc-----------------------------------------------------------------
map_psgc("0100000000")  # forward to the latest release

## ----map-psgc-target----------------------------------------------------------
map_psgc("0100000000", to = "Q4_2023")

