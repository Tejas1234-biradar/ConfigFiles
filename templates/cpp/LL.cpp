
#include <bits/stdc++.h>
#define MOD 1000000007
#define int long long
#define let auto
#define out(x) std::cout << x
#define outln(x) std::cout << x << "\n"
#define endl "\n"
#define ll long long
#define vi vector<int>
#define rep(i, a, b) for (int i = a; i < b; i++)
#define fo(i, n) for (int i = 0; i < (n); ++i)
#define pb push_back
#define mp make_pair
#define F first
#define S second
#define yes cout << "YES\n"
#define no cout << "NO\n"
#define all(x) x.begin(), x.end()
#define rall(x) rbegin(x), rend(x)
#define pii pair<int, int>
#define vvi vector<vector<int>>
#define mii map<int, int>
#define umii unordered_map<int, int>
#define si set<int>
#define usi unordered_set<int>
#define read(a, n)                                                             \
  for (int i = 0; i < n; ++i)                                                  \
    cin >> a[i];
#define print(a, n)                                                            \
  for (int i = 0; i < n; ++i) {                                                \
    cout << a[i] << " ";                                                       \
  }                                                                            \
  cout << "\n";

using namespace std;

// Singly Linked List Node
struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *n) : val(x), next(n) {}
};

// Doubly Linked List Node
struct DListNode {
    int val;
    DListNode *prev;
    DListNode *next;
    DListNode() : val(0), prev(nullptr), next(nullptr) {}
    DListNode(int x) : val(x), prev(nullptr), next(nullptr) {}
    DListNode(int x, DListNode *p, DListNode *n) : val(x), prev(p), next(n) {}
};

void run() {
  // start here all the best
}

int32_t main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);
  run();
  return 0;
}
