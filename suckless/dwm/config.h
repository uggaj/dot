/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 2;
static const unsigned int snap      = 32;
static const unsigned int gappih    = 8;
static const unsigned int gappiv    = 8;
static const unsigned int gappoh    = 10;
static const unsigned int gappov    = 10;
static const int smartgaps          = 1;
static const int showbar            = 1;
static const int topbar             = 1;

static const unsigned int barpadv   = 4;
static const unsigned int barpadh   = 6;
static const unsigned int barheight = 2;
static const unsigned int barborder = 2;
static const unsigned int floatbar  = 1;

static const char *fonts[]    = { "SpaceMono Nerd Font:size=10:weight=bold" };
static const char dmenufont[] = "SpaceMono Nerd Font:size=10:weight=bold";

static const char col_bg[]      = "#1b182c";
static const char col_fg[]      = "#cbe3e7";
static const char col_black[]   = "#100e23";
static const char col_accent[]  = "#906cff";
static const char col_blue[]    = "#91ddff";
static const char col_dim[]     = "#565575";
static const char col_border[]  = "#c991e1";
static const char col_normbord[]= "#565575";

static const char *colors[][3] = {
    /*               fg          bg          border        */
    [SchemeNorm] = { col_fg,     col_bg,     col_normbord  },
    [SchemeSel]  = { col_black,  col_accent, col_border    },
    [SchemeBar]  = { col_fg,     col_black,  col_normbord  },
};

/* tagging */
static const char *tags[] = { "TERM", "VM" };

static const Rule rules[] = {
    /* class                   instance  title  tags mask  isfloating  monitor */
    { ".virt-manager-wrapped", NULL,     NULL,  1 << 1,    0,          -1 },
    { "pavucontrol",           NULL,     NULL,  0,         1,          -1 },
    { "Qalculate-gtk",         NULL,     NULL,  0,         1,          -1 },
    { "Arandr",                NULL,     NULL,  0,         1,          -1 },
};

/* layout(s) */
static const float mfact        = 0.60;
static const int nmaster        = 1;
static const int resizehints    = 0;
static const int lockfullscreen = 1;
static const int refreshrate    = 60;

static const Layout layouts[] = {
    { "[]=",  tile    },   /* default */
    { "[M]",  monocle },
    { "><>",  NULL    },   /* floating */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY, view,       {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY, toggleview, {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY, tag,        {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY, toggletag,  {.ui = 1 << TAG} },

#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0";
static const char *dmenucmd[] = {
    "dmenu_run", "-m", dmenumon,
    "-fn", dmenufont,
    "-nb", col_bg,  "-nf", col_fg,
    "-sb", col_accent,  "-sf", col_black,
    NULL
};
static const char *termcmd[]   = { "kitty", NULL };
static const char *br_up[]     = { "brightnessctl", "set", "+5%", NULL };
static const char *br_down[]   = { "brightnessctl", "set", "5%-", NULL };
static const char *upvol[]     = { "wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%+", NULL };
static const char *downvol[]   = { "wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%-", NULL };
static const char *mutevol[]   = { "wpctl", "set-mute",   "@DEFAULT_AUDIO_SINK@", "toggle", NULL };

static const Key keys[] = {
    /* modifier                     key        function        argument */
    { MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
    { MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
    { MODKEY,                       XK_b,      togglebar,      {0} },
    { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
    { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
    { MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
    { MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
    { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
    { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
    { MODKEY|Mod1Mask,              XK_h,      incrgaps,       {.i = +1 } },
    { MODKEY|Mod1Mask,              XK_l,      incrgaps,       {.i = -1 } },
    { MODKEY|Mod1Mask|ShiftMask,    XK_h,      incrogaps,      {.i = +1 } },
    { MODKEY|Mod1Mask|ShiftMask,    XK_l,      incrogaps,      {.i = -1 } },
    { MODKEY|Mod1Mask|ControlMask,  XK_h,      incrigaps,      {.i = +1 } },
    { MODKEY|Mod1Mask|ControlMask,  XK_l,      incrigaps,      {.i = -1 } },
    { MODKEY|Mod1Mask,              XK_0,      togglegaps,     {0} },
    { MODKEY|Mod1Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
    { MODKEY,                       XK_y,      incrihgaps,     {.i = +1 } },
    { MODKEY,                       XK_o,      incrihgaps,     {.i = -1 } },
    { MODKEY|ControlMask,           XK_y,      incrivgaps,     {.i = +1 } },
    { MODKEY|ControlMask,           XK_o,      incrivgaps,     {.i = -1 } },
    { MODKEY|Mod1Mask,              XK_y,      incrohgaps,     {.i = +1 } },
    { MODKEY|Mod1Mask,              XK_o,      incrohgaps,     {.i = -1 } },
    { MODKEY|ShiftMask,             XK_y,      incrovgaps,     {.i = +1 } },
    { MODKEY|ShiftMask,             XK_o,      incrovgaps,     {.i = -1 } },
    { MODKEY,                       XK_z,      zoom,           {0} },
    { MODKEY,                       XK_Tab,    view,           {0} },
    { MODKEY,                       XK_q,      killclient,     {0} },
    { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
    { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
    { MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
    { MODKEY,                       XK_space,  setlayout,      {0} },
    { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
    { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
    { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
    { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
    { MODKEY,                       XK_period, focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
    { 0, XF86XK_AudioRaiseVolume,  spawn, {.v = upvol } },
    { 0, XF86XK_AudioLowerVolume,  spawn, {.v = downvol } },
    { 0, XF86XK_AudioMute,         spawn, {.v = mutevol } },
    { 0, XF86XK_MonBrightnessUp,   spawn, {.v = br_up } },
    { 0, XF86XK_MonBrightnessDown, spawn, {.v = br_down } },
    { 0, XK_Print, spawn, SHCMD("FILE=$HOME/Pictures/Screenshots/$(date +%F-%H%M%S).png; maim -s \"$FILE\" && notify-send -u low -i camera-photo 'Screenshot Taken' \"$FILE\"") },
    TAGKEYS(XK_1, 0)
    TAGKEYS(XK_2, 1)
    TAGKEYS(XK_3, 2)
    TAGKEYS(XK_4, 3)
    TAGKEYS(XK_5, 4)
    TAGKEYS(XK_6, 5)
    TAGKEYS(XK_7, 6)
    TAGKEYS(XK_8, 7)
    TAGKEYS(XK_9, 8)
    { MODKEY|ShiftMask, XK_q, quit, {0} },
};

/* button definitions */
static const Button buttons[] = {
    { ClkLtSymbol,  0,      Button1, setlayout,      {0} },
    { ClkLtSymbol,  0,      Button3, setlayout,      {.v = &layouts[2]} },
    { ClkWinTitle,  0,      Button2, zoom,            {0} },
    { ClkStatusText,0,      Button2, spawn,           {.v = termcmd } },
    { ClkClientWin, MODKEY, Button1, movemouse,       {0} },
    { ClkClientWin, MODKEY, Button2, togglefloating,  {0} },
    { ClkClientWin, MODKEY, Button3, resizemouse,     {0} },
    { ClkTagBar,    0,      Button1, view,            {0} },
    { ClkTagBar,    0,      Button3, toggleview,      {0} },
    { ClkTagBar,    MODKEY, Button1, tag,             {0} },
    { ClkTagBar,    MODKEY, Button3, toggletag,       {0} },
};
