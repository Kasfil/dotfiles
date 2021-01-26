from typing import List  # noqa: F401
import subprocess

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy

MOD = "mod4"
TERMINAL = "run_alacritty"

@hook.subscribe.startup_once
def autostart():
    """Process all startup application and code"""
    processes = [
        ['setxkbmap', '-option', 'caps:swapescape'],
        ['feh', '--bg-fill', '/home/kasf/Pictures/wp1902565-low-poly-wallpapers.jpg'],
    ]

    for process in processes:
        subprocess.run(process, capture_output=True, check=True)

colors = [
    ['#2a2f38', '#2a2f38'],
    ['#f92672', '#f92672'],
    ['#a6e22e', '#a6e22e'],
    ['#f4bf75', '#f4bf75'],
    ['#66d9ef', '#66d9ef'],
    ['#ae81ff', '#ae81ff'],
    ['#a1efe4', '#a1efe4'],
    ['#f8f8f2', '#f8f8f2'],
    ['#49483e', '#49483e'],
]

keys = [
    # Switch between windows in current stack pane
    Key([MOD], "k", lazy.layout.down(),
        desc="Move focus down"),
    Key([MOD], "j", lazy.layout.up(),
        desc="Move focus up"),
    Key([MOD], "h", lazy.layout.left(),
        desc="Move focus left"),
    Key([MOD], "l", lazy.layout.right(),
        desc="Move focus right"),

    # Move windows
    Key([MOD, "control"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([MOD, "control"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),
    Key([MOD, "control"], "h", lazy.layout.shuffle_left(),
        desc="Move window left in current stack "),
    Key([MOD, "control"], "l", lazy.layout.shuffle_right(),
        desc="Move window right in current stack "),

    # Resize window
    Key([MOD, 'shift'], 'k', lazy.layout.grow_up(),
        desc="Grow window up"),
    Key([MOD, 'shift'], 'j', lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([MOD, 'shift'], 'h', lazy.layout.grow_left(),
        desc="Grow window left"),
    Key([MOD, 'shift'], 'l', lazy.layout.grow_right(),
        desc="Grow window right"),

    # Switch window focus to other pane(s) of stack
    Key([MOD], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    # Swap panes of split stack
    Key([MOD, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([MOD, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([MOD], "Return", lazy.spawn(TERMINAL), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([MOD, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([MOD, "control"], "q", lazy.spawn('powerplan'), desc='Run rofi powerplan script'),
    Key([MOD], "d", lazy.spawn('rofi -show drun'),
        desc='show rofi drun'),
]

groups = [Group(i) for i in "12345"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([MOD], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([MOD, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
    ])

layout_default = {
    'border_focus': colors[2][0],
    'border_normal': colors[0][0],
    'border_width': 2,
    'margin': 6
}

layouts = [
    layout.MonadTall(**layout_default),
    layout.Columns(**layout_default),
    layout.Max(),
    # layout.Tile(**layout_default),
    # layout.Bsp(**layout_default),
    # layout.Stack(num_stacks=2),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font = 'Overpass Nerd Font',
    fontsize = 14,
    padding = 7,
)
extension_defaults = widget_defaults.copy()

bar_widget = [
    widget.GroupBox(
        foreground = colors[7],
        background = colors[0],
        margin_x = 0,
        margin_y = 4,
        padding_x = 6,
        padding_y = 10,
        highlight_method = 'block',
        this_current_screen_border = colors[3],
        block_highlight_text_color = colors[0],
        active = colors[4],
        inactive = colors[8],
        urgent_border = colors[1],
        rounded = False,
        disable_drag = True,
    ),
    widget.CPU(
        foreground = colors[2],
        format = 'CPU:{load_percent}%'
    ),
    widget.Memory(
        foreground = colors[3],
        format = 'RAM:{MemUsed}M',
    ),
    widget.CheckUpdates(
        foreground = colors[7],
        colour_have_update = colors[1],
        colour_no_update = colors[7],
        no_update_string = 'NoUpdate',
        distro = 'Arch_yay',
        display_format = ' {updates}',
    ),
    widget.Spacer(),
    widget.Wlan(
        foreground = colors[2],
        interface = 'wlp2s0',
        format = '  {essid}',
    ),
    widget.Volume(
        foreground = colors[3],
        fmt = ' {}',
    ),
    widget.Battery(
        foreground = colors[6],
        battery = 1,
        charge_char = '',
        discharge_char = '',
        full_char = '',
        format = '{char} {percent:2.0%}',
        show_short_text = False
    ),
    widget.Clock(
        foreground = colors[3],
        background = colors[8],
        format = '%a %B, %d - %H:%M',
    )
]

screens = [
    Screen(
        top = bar.Bar(
            bar_widget,
            27,
            background = colors[0],
            margin = 0,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([MOD], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([MOD], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([MOD], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
