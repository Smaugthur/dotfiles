from qtile_extras import widget
from .theme import colors
from qtile_extras.widget.decorations import RectDecoration, PowerLineDecoration

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=0,
        decorations=[
            PowerLineDecoration(path="arrow_left")
        ]
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=56,
        padding=-1
    )


def workspaces(): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='Mononoki Nerd Font',
            fontsize=16,
            margin_y=3,
            margin_x=10,
            padding_y=2,
            padding_x=3,
            borderwidth=0,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=True,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True,
            decorations = [
                RectDecoration(
                    colour = colors['grey'],
                    radius=8,
                    filled=True,
                    padding_y=5
                    )
            ]
            
        ),
        separator(),
        widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
        separator(),
    ]


primary_widgets = [

    *workspaces(),

    separator(),

    powerline('color4', 'dark'),

    icon(bg="color4", text=' '), # Icon: nf-fa-download
    
    widget.CheckUpdates(
        background=colors['color4'],
        colour_have_updates=colors['text'],
        colour_no_updates=colors['text'],
        no_update_string='0 ',
        display_format='{updates}',
        update_interval=1800,
        fmt='{} '
    ),

    powerline('color3', 'color4'),

    icon(bg="color3", text='  '),  # Icon: nf-fa-feed

    widget.KeyboardLayout(
        background=colors['color3'],
        configured_keyboards=['us', 'es'],
        update_interval=3,
        fmt='{} '
    ),

    powerline('color2', 'color3'),

    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5),

    powerline('color1', 'color2'),


    icon(bg="color1", fontsize=17, text=' '), # Icon: nf-mdi-calendar_clock

    widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color1'),

    widget.Systray(background=colors['dark'], padding=5),
]

def secondary_widgets() :
    return [
        *workspaces(),

        separator(),

        powerline('color1', 'dark'),

        widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),

        widget.CurrentLayout(**base(bg='color1'), padding=5),

        powerline('color2', 'color1'),

        widget.Clock(**base(bg='color2'), format='%d/%m/%Y - %H:%M '),

        powerline('dark', 'color2'),
        
    ]

widget_defaults = {
    'font': 'Mononoki Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
