#include <stdio.h>

int main(){
	int n;
	scanf("%d", &n);
	for(int i=0; i<n; i++){ // loop:
		for(int j=0; j<=i; j++){ // r13번 반복 
			printf("*"); // print_star:
		}
		printf("\n"); // print_line:
	}
	return 0; // exit:
}
