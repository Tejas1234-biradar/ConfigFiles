vector<bool> Sieve(int N) {
  vector<bool> isPrime(N, 1);
  isPrime[0] = isPrime[1] = 0;
  for (int i = 2; i < N; i++) {
    if (isPrime[i] == true) {
      for (int j = 2 * i; j * j < N; j += i) {
        isPrime[j] = false;
      }
    }
  }
  return isPrime;
}
