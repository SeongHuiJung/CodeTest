#include <iostream>
using namespace std;
int main() {
    int my[5][5];
    int answer[5][5];
    int flag[4] = {0};
    int cnt=0;
    bool cross=false;
    for (int i =0; i< 5; i++) {
        for (int j = 0 ;j< 5; j++) {
            cin >> my[i][j];
        }
    }
    for (int i =0; i< 5; i++) {
        for (int j = 0 ;j< 5; j++) {
            cin >> answer[i][j];
        }
    }
    
    for (int i = 0 ; i< 5; i++) {
        for (int j = 0 ; j<5;j++) {
            int check = answer[i][j];
            
            for (int valueX = 0; valueX< 5; valueX ++) {
                for (int valueY = 0 ; valueY< 5 ; valueY ++) {
                    if (check == my[valueX][valueY]) {
                        my[valueX][valueY] = 0 ;
                         
                        flag[0] = 0;
                        flag[1] = 0;
                        flag[2] = 0;
                        flag[3] = 0;
                        for (int x = 0; x< 5; x++) {
                            if (my[valueX][x] != 0 ) {
                                flag[0] = 1;
                                break;
                            }
                        }
                        for (int x = 0; x< 5; x++) {
                            if (my[x][valueY] != 0 ) {
                                flag[1] = 1;
                                break;
                            }
                        }
                        //왼->오른 대각선
                        if(valueX == valueY) {
                            for (int a = 0 ; a< 5 ; a++) {
                                if (my[a][a] != 0) {
                                    flag[2] = 1;
                                    break;
                                }
                            }
                        }
                        else flag[2] = 1;
                        
                        if (valueX + valueY == 4) {
                            for (int a = 0 ; a< 5 ; a++) {
                                if (my[a][5-a-1] != 0) {
                                    flag[3] = 1;
                                    break;
                                }
                            }
                        }
                        else flag[3] = 1;
                        
                        
                        
                        if(flag[0] == 0)
                        {
                            cnt++;
                        }
                        if(flag[1] == 0)
                        {
                            cnt++;
                        }
                        if(flag[2] == 0)
                        {
                            cnt++;;
                        }
                        if(flag[3] == 0)
                        {
                            cnt++;
                        }
                        if (cnt >=3) {
                            cout << i*5 + j+1  << '\n';
                            return 0;
                        }
                    }
                }
            }
        }
    }
}
