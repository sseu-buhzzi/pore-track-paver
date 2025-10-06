#include "sokoban.h"

typedef enum grid_item_e {
	GRID_MPT, // empty
	GRID_WAL, // wall
	GRID_DST, // destination
	GRID_BOX, // box
	GRID_PLR // player
} grid_item_t;

typedef char map_t[9][8];

static const map_t souko_map = {
	{GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL},
	{GRID_WAL, GRID_WAL, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_DST, GRID_WAL},
	{GRID_WAL, GRID_WAL, GRID_MPT, GRID_WAL, GRID_MPT, GRID_MPT, GRID_DST, GRID_WAL},
	{GRID_WAL, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_DST, GRID_WAL},
	{GRID_WAL, GRID_MPT, GRID_WAL, GRID_WAL, GRID_MPT, GRID_MPT, GRID_DST, GRID_WAL},
	{GRID_WAL, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_DST, GRID_WAL},
	{GRID_WAL, GRID_MPT, GRID_MPT, GRID_WAL, GRID_WAL, GRID_MPT, GRID_DST, GRID_WAL},
	{GRID_WAL, GRID_WAL, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_DST, GRID_WAL},
	{GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL, GRID_WAL}
};

static map_t item_map = {
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_BOX, GRID_MPT, GRID_BOX, GRID_BOX, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_BOX, GRID_BOX, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_PLR, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_BOX, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_BOX, GRID_MPT, GRID_MPT},
	{GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT, GRID_MPT}
};

static int player_x = 5;
static int player_y = 5;

static unsigned char display_buf[1024];

long sokoban_update() {
	char c;
	unsigned int next_x;
	unsigned int next_y;
	unsigned int next2_x;
	unsigned int next2_y;
	unsigned int dst_cnt = 0;
	unsigned char *display_it = display_buf + (sizeof STR_CARRIAGE_RETURN - 1);
	*(uint64_t *) display_buf = 81755160206107;
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID_WITH_CNT, 0)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID_WITH_CNT, 1)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID_WITH_CNT, 2)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID_WITH_CNT, 3)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID_WITH_CNT, 4)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID_WITH_CNT, 5)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID_WITH_CNT, 6)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID_WITH_CNT, 7)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID_WITH_CNT, 8)
	*(uint32_t *) display_it = 1831885595;
	display_it += sizeof STR_CLEAR - 1;
	if (dst_cnt == 7) {
		return -1;
	}
	write(STDOUT_FILENO, display_buf, display_it - display_buf);
	read(STDIN_FILENO, &c, sizeof c);
	switch (c) {
		case 'w':
		next_x = player_x;
		next_y = player_y - 1;
		next2_x = player_x;
		next2_y = player_y - 2;
		break;
		case 'd':
		next_x = player_x + 1;
		next_y = player_y;
		next2_x = player_x + 2;
		next2_y = player_y;
		break;
		case 's':
		next_x = player_x;
		next_y = player_y + 1;
		next2_x = player_x;
		next2_y = player_y + 2;
		break;
		case 'a':
		next_x = player_x - 1;
		next_y = player_y;
		next2_x = player_x - 2;
		next2_y = player_y;
		break;
		default: return 0;
	}
	if (souko_map[next_y][next_x] == GRID_WAL) {
		return 0;
	}
	if (item_map[next_y][next_x] == GRID_MPT) {
		item_map[next_y][next_x] = GRID_PLR;
		item_map[player_y][player_x] = GRID_MPT;
		player_x = next_x;
		player_y = next_y;
	} else if (item_map[next_y][next_x] == GRID_BOX && souko_map[next2_y][next2_x] != GRID_WAL && item_map[next2_y][next2_x] == GRID_MPT) {
		item_map[next2_y][next2_x] = GRID_BOX;
		item_map[next_y][next_x] = GRID_PLR;
		item_map[player_y][player_x] = GRID_MPT;
		player_x = next_x;
		player_y = next_y;
	}
	return 0;
}

long draw_last_time() {
	unsigned char *display_it = display_buf + (sizeof STR_CARRIAGE_RETURN - 1);
	*(uint64_t *) display_buf = 81755160206107;
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 0)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 1)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 2)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 3)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 4)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 5)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 6)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 7)
	REPEAT_PRINT_ROW(REPEAT_PRINT_GRID, 8)
	*(uint32_t *) display_it = 1831885595;
	return write(STDOUT_FILENO, display_buf, display_it - display_buf + (sizeof STR_CLEAR - 1));
}
