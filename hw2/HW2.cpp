#include <iostream>
#include <cstring>
#include <algorithm>
#include <iomanip>

using namespace std;
const int MATCH = 3, MISMATCH = -1, GAP = -2; 
int main(){
    string s1, s2;
    cin >> s1 >> s2;
    int l1 = s1.length(), l2 = s2.length();
    int score[l1 + 1][l2 + 1], dir[l1 + 1][l2 + 1];
    int max_i = 0, max_j = 0, max_score = 0;
    memset(score, 0, sizeof(score));
    memset(dir, 0, sizeof(dir));
    
    for(int i = 1; i < l1 + 1; i++){
        for(int j = 1; j < l2 + 1; j++){
            int match_score = s1[i - 1] == s2[j - 1]? MATCH: MISMATCH;
            int match_term = score[i - 1][j - 1] + match_score;
            int left_term = score[i][j - 1] + GAP;
            int up_term = score[i - 1][j] + GAP;
            if(left_term >= up_term && left_term >= match_term){
                dir[i][j] = 1;
                score[i][j] = left_term;
            }

            if(up_term >= left_term && up_term >= match_term){
                dir[i][j] = 2;
                score[i][j] = up_term;
            }

            if(match_term >= up_term && match_term >= left_term){
                dir[i][j] = 3;
                score[i][j] = match_term;
            }
            if(score[i][j] > max_score){
                max_i = i, max_j = j;
            }
            
        }
    }

    int curr_i = max_i, curr_j = max_j;

    cout << "TRACEBACK" << endl;
    while(dir[curr_i][curr_j] != 0){
        int now_dir = dir[curr_i][curr_j];
        if(now_dir == 1){
            curr_j = curr_j - 1;
        }
        if(now_dir == 2){
            curr_i = curr_i - 1;
        }
        if(now_dir == 3){
            curr_i = curr_i - 1;
            curr_j = curr_j - 1;
        }
        cout << now_dir;
    }
    cout << endl;

    cout << "SCORE" << endl;
    for(int i = 0; i < l1 + 1; i++){
        for(int j = 0; j < l2 + 1; j++){
            cout << setw(4) << score[i][j];
        }
        cout << endl;
    }
    cout << "DIR" << endl;
    for(int i = 0; i < l1 + 1; i++){
        for(int j = 0; j < l2 + 1; j++){
            cout << setw(4) << dir[i][j];
        }
        cout << endl;
    }
}