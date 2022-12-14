--TSQL2012 ar gaeshva bazashi  :))))))))))))

use Hardware

--გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომელთა მწარმოებელი არის Hewlett-Packard;
select  Price,Name  from Products where ManufacturerId in(select ManufacturerId from Manufacturers where Name like 'Hewlett-Packard')
go
--გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომლებიც არ უწარმოებია Fujitsu -ს;
select  Price,Name  from Products where ManufacturerId in(select ManufacturerId from Manufacturers where Name not like 'Fujitsu')
go
--გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომელთა მწარმოებელი არის Sony, Fujitsu, IBM ან Intel;
select  Price,Name  from Products where ManufacturerId in(select ManufacturerId from Manufacturers where Name in('Sony','Fujitsu','IBM','Intel'))
go
--გამოიტანეთ იმ კომპანიების სახელწოდებები, რომლებმაც აწარმოეს 200 -ზე უფრო მაღალი  ღირებულების მქონე პროდუქტები;
select name from Manufacturers where ManufacturerId in(select ManufacturerId from Products where price>200) 
go
--გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომლებსაც არ აწარმოებს Genius და Dell
select  Price,Name  from Products where ManufacturerId in(select ManufacturerId from Manufacturers where Name not in ('Genius','Dell'))
go
--გამოიტანეთ იმ მწარმოებელთა რაოდენობა, რომლებიც აწარმოებენ drive -ებს
select count(Name) from Manufacturers where ManufacturerId in(select ManufacturerId from Products where name not like 'drive')
go
/*გამოიტანეთ Intel -ის მიერ წარმოებული იმ პროდუქტების რაოდენობა,
რომელთა ფასი აღემატება Intel -ის მიერ წარმოებული პროდუქტების საშუალო ფასს.*/
---???

use WorldEvents
--	გამოიტანეთ ევროპაში გამართულ მოვლენების რაოდენობა;
select count(EventName) from Event 
where CountryID in(select CountryID from Country where ContinentID in(select ContinentID from Continent where ContinentName like 'Europe'))
go

--გამოიტანეთ აფრიკაში ყველაზე ადრე გამართული მოვლენის თარიღი;
select min(EventDate) from Event 
where CountryID in(select CountryID from Country where ContinentID in(select ContinentID from Continent where ContinentName like 'Africa'))
go
--	გამოიტანეთ ჩრდილოეთ და სამხრეთ ამერიკაში არსებული ქვეყნების რაოდენობა;
select count(CountryName) from Country 
where CountryID in( select CountryID from Continent where ContinentName in ( 'North America','South America'))
go
--გამოიტანეთ ახალ წელს გამართული ეკონომიკასთან დაკავშირებული მოვლენების რაოდენობა;
--????????

--	გამოიტანეთ ევროპაში ყველაზე გვიან გამართული, სპორტის კატეგორიასთან დაკავშირებული მოვლენის თარიღი.
/*select max(EventDate) from Event where CategoryID in(select CategoryID from Category where CategoryName like 'Sport' ) 
and  CountryID in(select CountryID from Country where ContinentID in(select ContinentID from Continent where ContinentName like 'Europe'))
go*/