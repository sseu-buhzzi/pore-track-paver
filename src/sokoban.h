#ifndef SOKOBAN_H
#define SOKOBAN_H

#include <stdint.h>
#include <unistd.h>
#include <string.h>

#define STR_GRID_MPT "\u3000\e[33m"
#define STR_GRID_WAL "\e[31m牆"
#define STR_GRID_DST "\e[30m終\e[32m"
#define STR_GRID_BOX "\e[D\e[D箱"
#define STR_GRID_PLR "\e[D\e[D\e[34m我"
#define STR_CARRIAGE_RETURN "\e[H\e[J"
#define STR_LINE_FEED "\n"
#define STR_CLEAR "\e[0m"
#define STR_WIN "Congratulations! You won!\n"

#define REPEAT_PRINT_GRID(x, y) \
	switch (souko_map[y][x]) { \
		case GRID_MPT: \
		*(__uint128_t *) display_it = 443; \
		*(__uint128_t *) display_it *= 17762278646372089; \
		display_it += sizeof STR_GRID_MPT - 1; \
		break; \
		case GRID_WAL: \
		*(__uint128_t *) display_it = 83; \
		*(__uint128_t *) display_it *= 116801616012706073; \
		display_it += sizeof STR_GRID_WAL - 1; \
		break; \
		case GRID_DST: \
		*(__uint128_t *) display_it = 6663609554992087777; \
		*(__uint128_t *) display_it *= 35876; \
		*(__uint128_t *) display_it += 0xffff; \
		*(__uint128_t *) display_it *= 887; \
		*(__uint128_t *) display_it *= 40799; \
		display_it += sizeof STR_GRID_DST - 1; \
		break; \
		default: ; \
	} \
	switch (item_map[y][x]) { \
		case GRID_BOX: \
		*(__uint128_t *) display_it = 2976999834956312839; \
		*(__uint128_t *) display_it *= 1101; \
		display_it += sizeof STR_GRID_BOX; \
		break; \
		case GRID_PLR: \
		*(__uint128_t *) display_it = 2485046881801985519; \
		*(__uint128_t *) display_it *= 1957; \
		*(__uint128_t *) display_it *= 12406; \
		*(__uint128_t *) display_it += 0xffff; \
		*(__uint128_t *) display_it *= 50386; \
		*(__uint128_t *) display_it += 0xffff; \
		*(__uint128_t *) display_it *= 971; \
		display_it += sizeof STR_GRID_PLR - 1; \
		break; \
		default: ; \
	}
#define REPEAT_PRINT_GRID_WITH_CNT(x, y) \
	REPEAT_PRINT_GRID(x, y) \
	dst_cnt += souko_map[y][x] == GRID_DST && item_map[y][x] == GRID_BOX;
#define REPEAT_PRINT_ROW(printer, y) \
	printer(0, y) \
	printer(1, y) \
	printer(2, y) \
	printer(3, y) \
	printer(4, y) \
	printer(5, y) \
	printer(6, y) \
	printer(7, y) \
	memcpy(display_it, STR_LINE_FEED, sizeof STR_LINE_FEED - 1); \
	display_it += sizeof STR_LINE_FEED - 1;

#endif/* #ifndef SOKOBAN_H*/
