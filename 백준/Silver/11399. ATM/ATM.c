#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#pragma warning(disable:4996)
int sum(int *p, int num);
int main() {
	int N, *p,time=0;
	int i, j, tmp;
	scanf("%d", &N);
	p = (int *)malloc(N * sizeof(int));
	for (i = 0; i < N; i++)
		scanf("%d", p + i);
	for (i = 0; i < N - 1; i++) { //오름차순 버블정렬
		for (j = 0; j < N - 1; j++) {
			if (*(p + j) > *(p + j + 1)) {
				tmp = *(p + j);
				*(p + j) = *(p + j + 1);
				*(p + j + 1) = tmp;
			}
		}
	}
	for (i = 0; i < N; i++) {
		time += sum(p,i); //i증가시마다 앞의 대기시간을 모두 합함
	}
	printf("%d", time);
	free(p);
}
int sum(int *p, int num) {
	int i, time = 0;
	for (i = 0; i <= num; i++)
		time += *(p + i);
	return time;
}