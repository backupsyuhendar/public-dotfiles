/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const char *upvol[]   = { "volup", NULL};
static const char *downvol[] = { "voldown", NULL};
static const char *mutevol[] = { "volmute", NULL };
static const char *brightup[] = { "brightup", NULL};
static const char *brightdown[] = { "brightdown", NULL};
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 7;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
// static const char *fonts[]          = { "monospace:size=10", "FontAwesome:size=12", "Hack:size=12" };
static const int horizpadbar        = 2;        /* horizontal padding for statusbar */
static const int vertpadbar         = 5;        /* vertical padding for statusbar */ 
static const char *fonts[]          = {"NotoSansMono Nerd Font:size=10"};
static const char dmenufont[]       = "NotoSansMono Nerd Font:size=10";
#include "themes/dark/my-gruvbox.h"

static const char *const autostart[] = {
	"nm-applet", NULL,
	"picom", "-f", NULL,
	"nitrogen", "--restore", NULL,
	"sh", "-c", "while :; do sb-all; sleep 1; done", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = { "", "", "", "", "5", "", "", "", "" };
static const char *defaulttagapps[] = { "st", NULL, "chromium", "pcmanfm", NULL, "subl", "firefox", "telegram-desktop", NULL };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     	 NULL,      NULL,	         0,            	1,           -1 },
	{ "firefox",  	 NULL,      NULL,       1 << 6,       		0,           -1 },
	{ "Chromium",  	 NULL, 	  	NULL, 	    1 << 2, 			0, 			 -1	},
	{ "Pcmanfm",  	 NULL, 	  	NULL, 	    1 << 3, 			0, 			 -1	},
	{ "zoom",  		 NULL, 	  	NULL, 	  	1 << 8, 			0, 			 -1	},
	{ "mpv",  		 NULL, 	  	NULL, 	  	1 << 1, 			0, 			 -1	},
	{ "Sublime_text",  		     NULL, 	  	NULL, 	  	1 << 5, 			0, 			 -1},
	{ "TelegramDesktop",  		 NULL, 	  	NULL, 	  	1 << 7, 			0, 			 -1	},
	{ "Brave-browser",  		 NULL, 	  	NULL, 	  	1 << 2, 			0, 			 -1},
	{ "Brave-browser-nightly", 	 NULL, 	  	NULL, 	  	1 << 2, 			0, 			 -1},
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
// #define MODKEY Mod1Mask
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
// static const char *dmenucmd[] = {"dmenu_run"};
static const char *termcmd[]  = { "st", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ 0,                    	XF86XK_AudioLowerVolume, spawn, {.v = downvol } },
	{ 0,                    	XF86XK_AudioMute, spawn, {.v = mutevol } },
	{ 0,                    	XF86XK_AudioRaiseVolume, spawn, {.v = upvol   } },	
	{ 0,	                	XF86XK_MonBrightnessUp, spawn, {.v = brightup   } },		
	{ 0, 						XF86XK_MonBrightnessDown, spawn,  {.v = brightdown   } },	
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_d,      spawndefault,   {0} },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
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
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -2 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +2 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_e,      try_quit,       {0} },
	{ MODKEY|ShiftMask|ControlMask, XK_e,      quit,           {0} },
	{ MODKEY,						XK_q,      quit,           {1} }, 
	
	/* 	=========================== My Keyboard Shortcut =========================================== */

	{ MODKEY,             			XK_Return, 		spawn,         SHCMD("tabbed -r 2 st -w ''")  },
	{ MODKEY|ShiftMask,				XK_r,			spawn,		  SHCMD("rofi -show run") },
	{ MODKEY,						XK_r,			spawn,		  SHCMD("rofi -show drun -show-icons") },
	{ MODKEY,						XK_s,			spawn,		  SHCMD("scrot-me") },
	{ MODKEY|ShiftMask,				XK_s,			spawn,		  SHCMD("scrot-gui") },
	{ MODKEY|ShiftMask,				XK_Print,		spawn,		  SHCMD("scrot-delay") },
	{ MODKEY,						XK_Print,		spawn,		  SHCMD("flameshot-imgck") },
	{ MODKEY|ShiftMask,				XK_p,		spawn,		  SHCMD("playerctl play-pause") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};


/* how many windows should be open when quitting? */
/* on a stock dwm install, this seems to be two; however, you'll have to
 * change it depending on how many invisible X windows exist */
/* you can get a list with `xwininfo -tree -root`. */
static const int EMPTY_WINDOW_COUNT = 3;
