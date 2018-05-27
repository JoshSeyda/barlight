# [Barlight](https://barlight.herokuapp.com)
![Barlight](https://github.com/joshseyda/barlight/blob/master/public/images/purple-lamp.png)
>Barlight is the first social medial platform to put service industry professionals first. It is a place for Bartenders, Cooks, Servers, and Baristas to indicate their workplace availability to their regular customers, in hopes of reinforcing the existing culture of mutual reciprocity in the service industry.

---
![GitHub issue age](https://img.shields.io/badge/created%20on-2018--05--21-brightgreen.svg)
![GitHub closed pull requests](https://img.shields.io/badge/closed%20pull%20requests-20-blue.svg) 
![CocoaPods](https://img.shields.io/cocoapods/l/AFNetworking.svg)
---
#### Bartenders - "Let your regulars know when you're working, and if now's 'A Good Time'"

#### Customers - "Because you're sick of reading Buzzfeed articles on 'Why Your Bartender Hates You'"
---
## Table of Contents

- [Inspiration](#inspiration)
- [Goals](#goals)
- [Components](#components)
	- [Technologies](#technologies)
- [License](#license)
---
## Inspiration

Our team is made up of two ex-service industry workers and one non-service industry worker. We have taken our shared experiences and used them to craft a context for 'industry' folks to take center stage and facilitate their customer relationships in a meaningful and fulfilling way. Gone are the selfies in empty jobs posted across facebook and Instagram, trying to bring your friends and close customers in. Now with the ease of flipping a light switch you can tell your community that you are around, and you want visitors, no posturing necessary. 

## Status

We are currently preparing for initial release of our MVP page, with essential location, scheduling, authentication and image storage features.

## Goals

Ultimately we are working towards a gamified, multi-tier, scoped experience building out from the service worker as both the content creator and connection mediator. Their customers, can follow them, and depending on their interactions, gain higher degrees of connection and access on the platform. Venues, as of yet, are only associated locations, but we will be building out their accounts and features. Eventually service workers will be able to leave reviews about customers and venues, as well as post status updates and scoped events. Venues will be able to post job listings and receive curated applications inside the network. Eventually, Barlight will be positioned as an optimized solution for industry specific advertising and networking. 


## Components

1. User accounts and tiered access
2. Geolocation 
3. Schedule management 
4. Image storage 
5. Custom calculator for industry specific tip calculations, customer side


### Technologies

* Devise for user authentication
* Geolocator and Google Maps API for location management and display
* FullCalendar for schedule rendering and tracking
* Amazon S3 Cloud storage for user uploaded images

## License
MIT License

Copyright (c) [2018] [Alex Cooper, Caroline Russel, Josh Seyda]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.