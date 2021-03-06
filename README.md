AC Control
-------------

This project is a result of my tinkering, and constant curiousity.

Currently, it does a VERY basic few things. Well it does one thing really.

It takes commands (from a web based front end) and sends them over to an [Arduino](https://www.sparkfun.com/products/11021) board, which then emulates a remote control for the Air Conditioner (a fairly old Haier model, yet new enough to use an IR remote control) in my home office. It's a poor mans DIY Nest; with a really limited feature base.


### Seriously? Who does this...

Me, a web developer that lost his remote to his window air conditioner unit.

### But why?

Lost the remote and the key pad doesn't work very well.

Besides, maybe I want to control my air conditioner when I'm not at home.

### How does it work?

This rails app, sits on a server in the same physical location as the air conditioner. I mean, USB cable length close. Maybe I'll add some Xbee's or a BT Arduino for wireless.

Using the serial communication capabilities of this machine (and the Arduino board connected to it), the rails app then sends serial commands (via the `serialport` gem) to the Arduino.

Next, the [Arduino](https://www.sparkfun.com/products/11021), using the code found in the `arduino` folder and the `IRremote` library (https://github.com/shirriff/Arduino-IRremote) translates those commands into usable IR signals. Using PWM it modulates a [IR LED](https://www.sparkfun.com/products/9349) to act like the original remote for the unit. The circuit is fairly simple, only requires power, and a PWM output from the Arduino. For completeness, I eventually plan to upload a schematic/drawing of it.

I retreived the proper IR signals by using a remote for a newer (yet very similar) Haier air conditioner unit. The remote performed perfectly on my unit.

I was able to capture/decode the signals by using a [Radio Shack IR Receiver](http://www.radioshack.com/product/index.jsp?productId=2049727), the Arduino, and the `IRremote` library. I'll post the code to that when I find it, I don't believe I saved it.

### Uhh, this seems like overkill or over engineering

Of course it does! But it was fun. Also, I have plans to expand this "Internet of Things" in my house, and control my second air conditioner, monitor power usage, monitor temps around the house, maybe even collect data from my fridge or freezer. It's also given me some time to stretch my 'maker' muscles, and build something with hardware (and some software).


