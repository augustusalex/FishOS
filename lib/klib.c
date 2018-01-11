#include "type.h"
#include "const.h"
#include "protect.h"
#include "proto.h"
#include "string.h"
#include "proc.h"
#include "global.h"

PUBLIC	void delay(int time) {
	int i, j, k;
	for (k = 0; k < time; ++k) {
		for (i = 0; i < 10000; ++i) {
			for (j = 0; j < 10000; ++j) {
			}
		}
	}
}
