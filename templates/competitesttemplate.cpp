/*
 * Author: vewake
 * $(GROUP)
 * Problem: $(PROBLEM)
 * URL: $(URL)
 * Start: $(DATE)
 */
#include <bits/stdc++.h>
#ifdef vewake
#include "debug.cpp"
#else
#define debug(...) 42
#endif
#define MOD 1000000007
#define INF 1e18
#define PI 3.141592653589793238
#define let auto
#define int long long
#define outln(x) std::cout << x << "\n"
#define out(x) std::cout << x
#define doutln(x) std::cout << setprecision(7) << fixed << x << endl
#define dout(x) std::cout << setprecision(7) << fixed << x
#define endl "\n"
#define ll long long
#define lld long long double
#define pii pair<int, int>
#define vi vector<int>
#define vpii vector<pii>
#define _GET_MACRO(_1, _2, _3, NAME, ...) NAME
#define _fo2(i, n) for (int i = 0; i < (n); ++i)
#define _fo3(i, a, b) for (int i = (a); i < (b); ++i)
#define _rfo2(i, n) for (int i = (n) - 1; i >= 0; --i)
#define _rfo3(i, a, b) for (int i = (b) - 1; i >= (a); --i)
#define rfo(...) _GET_MACRO(__VA_ARGS__, _rfo3, _rfo2)(__VA_ARGS__)
#define fo(...) _GET_MACRO(__VA_ARGS__, _fo3, _fo2)(__VA_ARGS__)
#define haa cout << "YES\n"
#define naa cout << "NO\n"
#define pb push_back
#define mp make_pair
#define F first
#define S second
#define all(x) x.begin(), x.end()
#define rall(x) rbegin(x), rend(x)
#define read(a, n)                                                             \
  for (int i = 0; i < n; ++i)                                                  \
    cin >> a[i];
#define print(a, n)                                                            \
  for (int i = 0; i < n; ++i) {                                                \
    cout << a[i] << " ";                                                       \
  }                                                                            \
  cout << "\n";

#define setbits(x) __builtin_popcountll(x)
#define lsb(x) __builtin_ctzll(x)
#define msb(x) (63 - __builtin_clzll(x))
#define comp(a) [](auto &x, auto &y) { return a; }

using namespace std;
void run(int testCase);
int32_t main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);
  int TestCase = 1;
  //
  cin >> TestCase;
  cin.ignore();
  //
  for (int i = 1; i <= TestCase; i++) {
    run(i);
  }
  return 0;
}
void run(int testCase) {
  // start here all the best
}
