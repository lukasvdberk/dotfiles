from i3pystatus import Status
from i3pystatus.weather import weathercom

status = Status()

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %-d %b %X",)

# Whether for Haarlem
status.register('weather',
    format='Haarlem: {icon}{current_temp}{temp_unit}{update_error}',
    interval=450,
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='e96e28312a651fe6c80573480b022674699d0ed8cea50602b66eb3b3d5c07d03',
        units='metric',
        update_error='<span color="#ff0000">!</span>',
    ),
)

# This would look like this:
# Discharging 6h:51m
status.register("battery",
    format="{status} {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=5,
    status={
        "DIS":  "Discharging",
        "CHR":  "Charging",
        "FULL": "Bat full",
    },
    color='#859900'
)

status.register("ping", 
    format="ping: {ping} ms",
    color='#859900'
)

status.register("cpu_usage",
    format="cpu: {usage:02}%",
    color='#859900'
)

status.register("mem", 
    format="RAM: {avail_mem} GiB", 
    color='#859900',
    divisor=1073741824
)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
status.register("pulseaudio",
    format="♪{volume}",
    color_unmuted="#0000FF"
)

status.register('now_playing',
    format='{artist}-{title}',
    color='#0000FF'
)

# Runs the scripts
status.run()
