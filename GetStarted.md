KosherSwift Documentation:
===

Table of Contents
---

1. [Introduction]()
2. [Sunrise, Sunset: Calculating Sunrise]()
3. [Zmanim]()
4. [Parashat Hashavua]()
5. [Chagim]()
6. [Sefira]()
7. [Daf Yomi]()
8. [Conclusion]()

--- 

1. Introduction
---

KosherSwift is a Swift port of Moshe Berman's [KosherCocoa](https://github.com/MosheBerman/KosherCocoa), an Objective-C port of Eliyahu Hershfeld's [KosherJava](http://www.kosherjava.com). Moshe and Eliyahu both put a tremendous amount of work into their APIs, and this project would have been close to impossible without them.

This document is a "Get Started" guid for KosherSwift. Please be mindful of the possibility that people will attempt to use whatever products you may build with this library to enhance their religious observance. Please keep that in mind and be careful with how you use this code.

With that in mind, let's get started.

2. Sunrise, Sunset: Calculating Sunrise
---
Sunrise and sunset are defined by where you are on Earth. For example, sunrise in California is long after sunrise in New York. While we use time zones to handle this when discussing time, we need to pinpoint where our user is in order to show them times that they can relate to. To do so, we use the `KSGeoLocation` class. The simplest use case is presented here:
 
    let location = KSGeoLocation(latitude: latitude, longitude: longitude, timeZone: timeZone)
    
---
**Note: When an initializer that doesn't expose altitude is called, the default altitude is 0.**

---
Now that we have a `KSGeoLocation` instance, we can pass it to the `KSAstronomicalCalendar` class to get sunrise and sunset times. 

    let calendar = KSAstronomicalCalendar(location: location)
    
Now we've got a calendar, we need to tell it which date we want to calculate for. The `KSAstronomicalCalendar` class has a `workingDate` property that defaults to `NSDate()`, but you can change it, like so.

    calendar.workingDate = date
    
Ok, we're ready to go. Let's get sunrise:
    
    let sunrise = calendar.sunrise()
    
This is sunrise at whatever the altitude of the `geoLocation` object has at a 90 degree zenith. That's it. Just four lines of code, three if you don't need to change the date:

    let location = KSGeoLocation(latitude: latitude, longitude: longitude, timeZone: timeZone)
    let calendar = KSAstronomicalCalendar(location: location)
    let sunrise = calendar.sunrise()
    
Sunrise, sunset. That's how it's done.

3. Zmanim
---
Zmanim are calculated by `KSZmanimCalendar` and its subclass `KSComplexZmanimCalendar`. Similar to sunrise, you can pass a location to a `KSZmanimCalendar` and then ask it for a zman.

    let location = KSGeoLocation(latitude: latitude, longitude: longitude, timeZone: timeZone)
    let calendar = KSZmanimCalendar(location: location)
    let shemaGra = calendar.sofZmanShmaGra()
    
That's it. There are over 100 different zmanim API. Have a look at the documentation.

4. Parashat Hashavua
---
There are two classes when working with Parshiot. `KSParashatHashavuaCalculator` returns a `KSParasha` object representing the parasha for a given date. For example:

    let parashaCalendar = KSParashatHashavuaCalculator()
    let parasha = parashaCalendar.parashaInDiasporaForDate(date)
    
Now we have the parasha for the supplied date. Whoo!

Parashat Hashavua follows one scheudule in Israel and different schedule everywhere else. This is because Jews in Israel don't celebrate the an extra day of sukkot or pesach. Depending on the year the parshiot diverge at different points in the calendar. To get the schedule in Israel, simply call `parashaInIsraelForDate:` instead of `parashaInDiasporaForDate:`.

	let parasha = parashaCalendar.parashaInIsraelForDate(date)

Now that we have a `KSParasha`, we can use the `name` method to get the Hebrew name of parasha. We can also call `transliteratedName` to get the same Hebrew name spelled out in English.

	let hebrewName = parasha.name()
	let translitiratedName = parasha.nameTransliterated() 

5. Chagim
---
To calculate the holidays, use `KSJewishCalendar`. Using the value of the `workingDate` property inherited from its superclass, `KSJewishCalendar` can determing if the supplied date is a holiday.  

Here's an example using `KSJewishCalendar`:

    let calendar = KSJewishCalendar(location: location)
    
    let isPesach = calendar.isPesach()      // check for passover
    let isHoliday = calendar.isYomTov()     // etc...

As alluded to in the Parashat Hashavua documentation, the holidays are observed for fewer days in Israel. If you want to check for holidays in Israel, change the `inIsrael` property to `true`.

    calendar.inIsrael = true // default is NO
    
You can also choose to respect or ignore the various holidays involving the modern state of Israel, such as Yom Ha'atzmaut:

    calendar.returnsModernHolidays = true // default is NO, YES will enable the modern holidays
    
6. Sefira
---
Calculating Sefira is super easy with `KSSefiratHaomerCalculator`. It's a one liner:

    let dayOfSefira = KSSefiratHaomerCalculator.dayOfSefiraForDate(date)

The public methods of this class all have two flavors: ones that accept a date argument and ones that dont. The ones that don't take an argument will default to `NSDate()`, like so:

    let dayOfSefira = KSSefiratHaomerCalculator.dayOfSefira()
    
Both of these methods will return 0 if it's not during the sefira count, otherwise, will return an NSInteger representing tonights count.

---
**It's important to note that this class does not adjust for the Jewish day beginning at sundown the night before. Test your code before deployment.**

---

There is also a pair of methods that will tell you if a date falls during the omer count without telling you the day. Here's how that works:

	let todayIsSefira = KSSefiratHaomerCalculator.fallsToday()
	let someDayIsSefira = KSSefiratHaomerCalculator.fallsOnDate(date)
	
**Functionality for getting a string from the count is still in the works.**
<!--To get a string from the count, you use `KSSefiraFormatter`. First, get the day with `KSSefiratHaomerCalculator`, as we did above:-->
<!---->
<!--    NSInteger dayOfSefira = [KSSefiratHaomerCalculator dayOfSefira];-->
<!--    -->
<!--Then, you initialize the sefira formatter, and configure it with a custom and a language:-->
<!--    -->
<!--    KSSefiraFormatter *sefiraFormatter = [[KSSefiraFormatter alloc] init];-->
<!--    sefiraFormatter.custom = KSSefiraCustomAshkenaz;-->
<!--    sefiraFormatter.language = KSSefiraLanguageHebrew;-->
<!--    -->
<!--The `custom` property supports Ashkenaz, Sefard, and Sephardic customs as defined in the `KSSefiraCustom` enumerated type in `KSSefiraFormatter.h`. -->
<!---->
<!--The `language` property supports Hebrew, English, and Transliterated Hebrew, as defined in the `KSSefiraLanguage` enumerated type in `KSSefiraFormatter.h`.-->
<!---->
<!--Now that we have a formatter set up, we have two options for getting the count. We can get just the count itself, like so:-->
<!---->
<!--    NSString *string = [sefiraFormatter countStringFromInteger:dayOfSefira];-->
<!--    -->
<!--Or, we can get a block of text which contains the count as well as medidations and prayers said before and after it, like so:-->
<!---->
<!--    KSSefiraPrayerAddition prayers = KSSefiraPrayerAdditionBeracha | KSSefiraPrayerAdditionHarachaman;-->
<!--    NSString *string = [sefiraFormatter countStringFromInteger:dayOfSefira withPrayers:prayers];-->
<!--    -->
<!--This will return a string containing the blessing before the count, the count itself, and the harachaman right after it. Like the other related types, `KSSefiraPrayerAddition` is defined in `KSSefiraFormatter.h`-->

---
<!--**As of this writing, there are a few limitations to the `KSSefiraFormatter` class. Transliterated Hebrew isn't implemented at all, and blessings are not supported when the language is set to English. In that case, you'll get just the count itself: "Today is the first day which is...".**-->
**'KSSefiraFormatter' still needs a bunch of work, but it has basic functionality.**

---





7. Daf Yomi
---
The Daf Yomi calculation classes work similarly to the Parasha calculation classes. You create a `KSDafYomiCalculator`, optionally assign a `workingDate`, and then ask it for a `KSDaf` for a given date. 
	
    let calculator = KSDafYomiCalculator(date: date)
	
	let daf = calculator.dafYomiBavli()
	//	or, if we want to get a specific date
	let daf = calculator.dafYomiBavliForDate(date)

To get the name of the daf, call the `name` method or the `transliteratedName` method:
    
	let hebrewName = daf.name()
	let transliteratedName = daf.nameTransliterated()
	
8. Conclusion
---
There is still a small handfull of things I would like to add, but this library is definitely usable. I am in the process of implementing KosherSwift into my app, [YidKit](yidkit.com).

Remember to provide your users with an adequate way to configuare a way for you to obtain their location. The primary cause of complaints in three years was nearly always a user who didn't know how to tell my apps where they were. 

If you've got any enhancements to offer, bugs to fix, or general contributions, feel free to contact me with a pull request or an email.

Dani Smith, September 2016