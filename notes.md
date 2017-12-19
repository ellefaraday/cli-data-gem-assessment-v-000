Potentially change interface to receive state and city name not number input

Class relationships:

<<<<<<< HEAD
<<<<<<< HEAD
  State has many cities, has many stores through cities
   City belongs to a state, has many stores
   Store belongs to a city

   Think classes probably need a find by name method- will need to add @@all if do

 Scraper notes:
=======
=======
>>>>>>> f4c27b0892d578314e7549ffab1270f324634dc1
State has many cities, has many stores through cities
 City belongs to a state, has many stores, should have City.all ??
 Store belongs to a city, should have Store.all ???

 Think classes probably need a find by name method

 Scraper notes
<<<<<<< HEAD
>>>>>>> f4c27b0892d578314e7549ffab1270f324634dc1
=======
>>>>>>> f4c27b0892d578314e7549ffab1270f324634dc1
  for getting stores associated with cities,
  as it enumerates have a current_city variable
  if the first li has class ibsCitYTitle set current_city to that city and use that to assign city to a store
  else us current_city as is
