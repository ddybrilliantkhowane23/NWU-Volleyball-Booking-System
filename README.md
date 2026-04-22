# NWU Volleyball Coaching Classes – Booking System

# Project Overview

This ASP.NET Web Forms application allows students to book virtual volleyball coaching classes.  
Classes are held only on **Mondays and Fridays**.  
The booking date determines the actual class date and time slot based on the selected campus.

# Features

- *Student details* – Name, Surname, Email (with validation)
- *Campus selection* – Mahikeng, Potchefstroom, Vanderbijlpark (RadioButtonList)
- *Calendar control* – Select booking date (only Mon/Fri allowed; error otherwise)
- *Class date calculation* –  
  - Mahikeng → 8 days after booking (10:00 – 12:00)  
  - Potchefstroom → 4 days after booking (11:00 – 13:00)  
  - Vanderbijlpark → 6 days after booking (08:00 – 10:00)
- *Validation* – Required fields, email format, valid campus, valid booking day
- *Confirmation message* – Includes student name, class day/date, time slot, email notice
- *Clear button* – Resets all fields and hides confirmation
- *CSS styling* – Background image, semi‑transparent panels, cyan/black button theme


# Technologies Used

| Technology                     | Purpose                               |
|--------------------------------|---------------------------------------|
| ASP.NET Web Forms (.NET 4.7.2) | Backend logic & server controls       |
| C#                             | Event handling & date calculations    |
| HTML5 / CSS3                   | Structure and styling                 |
| Visual Studio 2019 / 2022      | Development environment               |




