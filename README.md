# TrackerJacker
Very basic IP tracking system, a bit janky


# How it works
TrackerJacker works by taking an IP address, querying it's 'location' and logging it. The pinged location of an IP address is rarely the targets actual location, but a connection center or relay belonging to their ISP. The program aims to measure three or more of these connection center locations, and then you can use those coordinates to triangulate the targets location.

E.G the IP address xx.xx.xx.xx has connection centers at "-1, 2", "-1.02, 1.89", and "-1.23, 2.03". You can triangulate a general approximate area of where your target is using those three points.
