# load pkgs ---
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(shinycssloaders)
library(markdown)
library(fresh)
library(arrow)

# read in data ----
lake_data <- read_parquet("data/lake_data_processed.parquet")