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
    int score[(l1 + 1)*(l2 + 1)], dir[(l1 + 1)*(l2 + 1)];
    memset(score, 0, sizeof(score));
    memset(dir, 0, sizeof(dir));
    
    char* s1ptr = (char*) s1.c_str();
    char* s2ptr = (char*) s2.c_str();
    int* scoreptr = score;
    int* dirptr = dir;
    int* max_dirptr = 0;
    int max_score = 0;

    const int COL = l1 + 1;
    scoreptr = scoreptr + COL + 1;
    dirptr = dirptr + COL + 1;
    for(int i = 0; i < l2; i++){
        s1ptr = (char*) s1.c_str();
        for(int j = 0; j < l1; j++){
            int match_score = (*s1ptr) == (*s2ptr)? MATCH: MISMATCH;
            int match_term = (*(scoreptr - COL - 1)) + match_score;
            int left_term = (*(scoreptr - 1)) + GAP;
            int up_term = (*(scoreptr - COL)) + GAP;

            if(left_term >= up_term && left_term >= match_term){
                *dirptr = 1;
                *scoreptr = left_term;
            }
            if(up_term >= left_term && up_term >= match_term){
                *dirptr = 2;
                *scoreptr = up_term;
            }
            if(match_term >= up_term && match_term >= left_term){
                *dirptr = 3;
                *scoreptr = match_term;
            }
            if(left_term < 0 && up_term < 0 && match_term < 0){
                *dirptr = 0;
                *scoreptr = 0;
            }
            if(*scoreptr >= max_score){
                max_score = *scoreptr;
                max_dirptr = dirptr;
            }
            scoreptr += 1;
            dirptr += 1;
            s1ptr += 1;
        }
        // offset
        scoreptr += 1;
        dirptr += 1;
        s2ptr += 1;
    }


    cout << "SCORE" << endl;
    scoreptr = score;
    for(int i = 0; i < l2 + 1; i++){
        for(int j = 0; j < l1 + 1; j++){
            cout << setw(4) << *scoreptr;
            scoreptr += 1;
        }
        cout << endl;
    }
    cout << "DIR" << endl;
    dirptr = dir;
    for(int i = 0; i < l2 + 1; i++){
        for(int j = 0; j < l1 + 1; j++){
            cout << setw(4) << *dirptr;
            dirptr += 1;
        }
        cout << endl;
    }
    cout << max_score << endl;
    cout << "TRACEBACK" << endl;
    int* traceptr = max_dirptr;
    while(*(traceptr) != 0){
        int now_dir = *traceptr;
        if(now_dir == 1){
            traceptr = traceptr - 1;
        }
        if(now_dir == 2){
            traceptr = traceptr - COL;
        }
        if(now_dir == 3){
            traceptr = traceptr - 1 - COL;
        }
        cout << now_dir;
    }
    cout << endl;

    // cout << "SCORE" << endl;
    // for(int i = 0; i < l1 + 1; i++){
    //     for(int j = 0; j < l2 + 1; j++){
    //         cout << setw(4) << score[i][j];
    //     }
    //     cout << endl;
    // }

}