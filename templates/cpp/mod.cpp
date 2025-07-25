#define ll long long
const ll mod = 1e9 + 7;
ll inv(ll i) {
  if (i == 1)
    return 1;
  return (mod - ((mod / i) * inv(mod % i)) % mod) % mod;
}
ll mod_mul(ll a, ll b) {
  a = a % mod;
  b = b % mod;
  return (((a * b) % mod) + mod) % mod;
}
ll mod_add(ll a, ll b) {
  a = a % mod;
  b = b % mod;
  return (((a + b) % mod) + mod) % mod;
}
ll mod_sub(ll a, ll b) {
  a = a % mod;
  b = b % mod;
  return (((a - b + mod) % mod) + mod) % mod;
}
ll ceil_div(ll a, ll b) { return a % b == 0 ? a / b : a / b + 1; }
ll pwr(ll a, ll b) {
  a %= mod;
  ll res = 1;
  while (b > 0) {
    if (b & 1)
      res = res * a % mod;
    a = a * a % mod;
    b >>= 1;
  }
  return res;
}
