//
//  main.cpp
//  cppCodeTest
//
//  Created by 정성희 on 5/22/24.
//
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int N,M;
void dfs(int cnt, int *visit, int *list);
int main() {
    cin >> N >> M;
    int *visit;
    visit = new int[9]();
    int *list;
    list = new int[9]();
    dfs(0,visit,list);
}

void dfs(int cnt, int *visit, int *list) {
    // cnt : 나 몇번째수에 지금 넣을거에요
    if (cnt == M) {
        for (int i =0; i<M;i++) {
            cout << list[i] << " ";
        }
        cout << '\n';
        
    }
    else {
        for (int i = 1; i<=N; i++) {
            if (visit[i]==0) {
                visit[i] = 1;
                list[cnt] = i;
                dfs(cnt+1, visit,list);
                visit[i] = 0;
            }
        }
    }
}
