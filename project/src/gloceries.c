#include <stdlib.h>
#include <time.h>

#include "sokoban.h"

#define STR_WELL "\n\tWell... We need to interrupt you for a moment.\n"
#define STR_SUCCESS "\e[H\e[J\e[0m\tCongratulations! You found the solution.\n\tAnd please wait for the Easter egg...\n\n"
#define STR_FAILURE "\e[H\e[J\e[0m\tOh, I think you've failed. You don't need to continue anymore, let's start over.\n\tYou might have put those boxes into their destinations, or you haven't yet, but anyway your steps wouldn't match our rules. Try to figure the rules out.\n\n"
#define STR_FLANDRE \
"                              \e[31m_/|\n" \
"                            ,|   |\n" \
"            \e[0m___------>_    \e[31m/   /  |\n" \
"        \e[0m,..            ``\\\e[31m/   |   |\n" \
"     \e[0m__/                  \\      \e[31m|  \e[1m哼哼, 就是這樣~\n" \
"    \e[0m/   \e[31m/  __==__---_ _/^ \\_  \\ |\n" \
"   \e[0m{     \e[31m/\e[0m__  \\__/--,__/^^\\__/ \e[31m}\n" \
"  \e[33m,.\e[0m--.__/ \e[33m/ /  /|  /\\   | \\   \\\n" \
"r=|   /,/ / /--/ |/   ^-\"  |    |            \e[0m,/:\n" \
"\e[33m\\/\\_ /./  |   \e[31mr~\\     r~\\  \e[0m|\e[33m:   /        \e[0m__,./ /\n" \
"   \e[33m^| .| / \\  \e[31m{#)     (#}  \e[0m{ \e[33m\",/       \e[0m_,.=}  }=\e[33m-,__\n" \
"    | /| /  | \e[31m``   \e[0m`    \e[31m`` \e[0m/   \e[33m|     \e[0m,/  ,.==/   \e[33m\\__\\\n" \
"    \\;  |  | \e[0m`    ._,    /j \e[33mT/^    \e[0m,/  /\e[34m\\   \e[32m| \\\n" \
"\e[0m\\.    \e[33m\\^ \\;   \e[0m^>-.___,-=<'       ,/  /'\e[34m| |   \e[32m\\|\n" \
"  \e[0m\\.    \e[31m/`L^`\\>\e[0m.     ,r\e[31m/_^/\"\\   \e[0m/  /'\e[35m\\  \e[34m\\;\n" \
"\e[0m`\\ \\_\e[31m,'         \e[0m\\>, ;|    \e[31m,^\\ \e[0m\\\" / \e[35m| |\n" \
"\e[31m: /|\e[0m>_\e[31m<   7        \e[0mV       \e[31m|  }\e[0m--^  \e[35m\\;\n" \
" \e[31m| /  /===;}      \e[33m{_}     \e[31m/ =/\\\n" \
"  \"   \e[0m7  { \e[31mi / \e[33m/ /   \"\\  \e[31mX  \e[0m|\e[31m' }    \e[1m感謝各位的游玩, 愉快地結束吧~\n" \
"      \e[0m\\   \\  \e[31m|\e[33m| /  /|| ?\e[33m|   \e[0m; \e[31m\\\n" \
"       \e[0m\\   \\ \e[33m~y |,;\"_J// \e[31m\\\e[0m,|\n" \
"       .\\  }\e[31m: \e[0m__________ \e[31m;\e[0m=Y,\n" \
"       ;Y_J\e[31m/ \e[0m============ \e[31m\\ \e[0m\"\n" \
"         \e[31m/##################\\\n\n" \
"\e[0m\tThat's all, thanks for playing!\n"

#define STR_BRIEF "\e[H\e[J(You needn't input now. These informations will stay for 2s, and you can use Ctrl+C to quit to continue viewing them.)\n\nThis is a sokoban/推箱子 game, and we have added some special rules in it. You are " STR_GRID_MPT STR_GRID_PLR "\e[0m, and need to push those " STR_GRID_MPT STR_GRID_BOX " \e[0minto " STR_GRID_DST "\e[0m, and then it will be like this " STR_GRID_DST STR_GRID_BOX "\e[0m. " STR_GRID_WAL "\e[0ms are fixed, don't push it.\n\n(An example like this.)\n"
#define STR_OPER_EXPL "\n\e[0mYou should use WASD to control the moving direction. And to explaine it, it's that you input keys like WASD or any others, once or more, and then only after you press ENTER the canvas will refresh, with all keys you input recorded.\n\n"
#define STR_FLAG_EXPL "About the flag: you should use md5sum to parse your input, for example, if you input aaddssww, then you use command `echo -n aaddssww | md5sum` to get the output `fc27da25c4d09a67b7ba38e6a66848ef  -`, and your flag is `flag{fc27da25c4d09a67b7ba38e6a66848ef}`.\nWe prefer input strings in lowercase and your flags processed from uppercase ones aren't accepted.\n"

typedef enum grid_item_e {
	GRID_MPT, // empty
	GRID_WAL, // wall
	GRID_DST, // destination
	GRID_BOX, // box
	GRID_PLR // player
} grid_item_t;

typedef char map_t[5][8];

static const map_t souko_map = {
	{GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL},
	{GRID_WAL, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_DST, GRID_WAL},
	{GRID_WAL, GRID_MPT, GRID_MPT, GRID_WAL, GRID_MPT, GRID_MPT, GRID_MPT, GRID_WAL},
	{GRID_WAL, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_DST, GRID_WAL},
	{GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL}
};

static map_t item_map = {
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_BOX, GRID_MPT, GRID_BOX, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_PLR, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT}
};

static char display_buf[1024];

long draw_last_time();

static void render_easter_egg() {
	char *display_it = display_buf;
	const char *it = STR_FLANDRE;
	do {
		*display_it++ = *it;
		if (*it == '\n') {
			write(STDOUT_FILENO, display_buf, display_it - display_buf);
			display_it = display_buf;
			usleep(200000);
		}
	} while (*++it);
}


void print_tutorial() {
	char *display_it = display_buf + (sizeof STR_BRIEF - 1);
	memcpy(display_buf, STR_BRIEF, sizeof STR_BRIEF - 1);
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 0)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 1)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 2)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 3)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 4)
	write(STDOUT_FILENO, display_buf, display_it - display_buf);
	sleep(2); // It will be 2.
	write(STDOUT_FILENO, STR_OPER_EXPL, sizeof STR_OPER_EXPL - 1);
	sleep(2); // It will be 2.
	write(STDOUT_FILENO, STR_FLAG_EXPL, sizeof STR_FLAG_EXPL - 1);
	sleep(4); // It will be 4.
}

void print_result(long result) {
	draw_last_time();
	write(STDOUT_FILENO, STR_WELL, sizeof STR_WELL - 1);
	sleep(1);
	if (result) {
		write(STDOUT_FILENO, STR_FAILURE, sizeof STR_FAILURE - 1);
	} else {
		write(STDOUT_FILENO, STR_SUCCESS, sizeof STR_SUCCESS - 1);
		sleep(1);
		render_easter_egg();
	}
	while (read(STDIN_FILENO, &result, 1) == 1 && (result & 0xff) != '\n') { }
	while (read(STDIN_FILENO, &result, 1) == 1 && (result & 0xff) != '\n') { }
	exit(EXIT_SUCCESS);
}
