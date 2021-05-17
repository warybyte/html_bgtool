#!/usr/bin/env python3

import imgkit

options = {
     'height': '900',
     'width': '1600',
     "xvfb": "",
     'quiet': ''
    }

imgkit.from_file('/<PATH>/<TO>/<HTML>/bg.html', '/<PATH>/<TO>/<BACKGROUND>/background.jpg', options=options)
