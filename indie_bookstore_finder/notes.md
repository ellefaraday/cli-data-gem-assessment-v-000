Potentially change interface to receive state and city name not number input

Class relationships:

State has many cities, has many stores through cities
 City belongs to a state, has many stores
 Store belongs to a city

 Think classes probably need a find by name method- will need to add @@all if do

 Scraper notes
  for getting stores associated with cities,
  as it enumerates have a current_city variable
  if the first li has class ibsCitYTitle set current_city to that city and use that to assign city to a store
  else us current_city as is
