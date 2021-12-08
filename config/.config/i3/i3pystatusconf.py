from i3pystatus import Status

colors = []
with open('/home/lukas/.cache/wal/colors', 'r') as file:
        colors = file.read().split('\n')

#status = Status()
status = Status(logfile='/tmp/i3pystatus.log')
# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %-d %b %X",)

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
    color=colors[1]
)

status.register("ping", 
    format="ping: {ping} ms",
    host="lukas.sh",
    color=colors[1]
)

# status.register("network",
#     format_up="{interface} receive: {rx_tot_Mbytes} Mb/s, sent: {tx_tot_Mbytes} Mb/s",
#     interface="wlp7s0",
#     color_up=colors[1],
#     start_color=colors[1],
#     end_color=colors[1],
#     dynamic_color=colors[1],
# )


status.register("cpu_usage_bar",
    format="cpu: {usage_bar}",
    start_color=colors[1],
    end_color=colors[2]
)

status.register("mem",
    format="RAM: {avail_mem} GB",
    color=colors[1],
    divisor=1073741824
)

status.register("pulseaudio",
    format="♪{volume}",
    color_unmuted=colors[1]
)

status.register('now_playing',
    format='{status} {artist} - {title}',
    format_no_player='No media playing',
    color=colors[1]
)

# Runs the scripts
status.run()
