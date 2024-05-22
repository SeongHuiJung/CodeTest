#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#pragma warning(disable:4996)
void selfNum(int *x, int i) {
	int tmp = i;
	int sum = 0;
	while (i > 0) {
		sum += i % 10;
		i = i / 10;
	}
	sum += tmp;
	x[sum - 1] = 1;
}
int main() {
	int x[10000] = { 0 };
	int i;
	for (i = 1; i <= 9972; i++) {
		selfNum(x, i);
	}
	for (i = 0; i < 10000; i++) {
		if (x[i] == 0)
			printf("%d\n", i+1);
	}
}