
#include <bits/stdc++.h>
using namespace std;

// Monotonic stack template
// Type: 1 = Next Greater Element, 2 = Previous Greater Element,
//       3 = Next Smaller Element, 4 = Previous Smaller Element
vector<int> monotonicStack(vector<int> &arr, int type) {
  int n = arr.size();
  vector<int> res(n, -1); // -1 if no element exists
  stack<int> st;          // stores indices

  if (type == 1) {
    // Next Greater Element (right)
    for (int i = 0; i < n; i++) {
      while (!st.empty() && arr[i] > arr[st.top()]) {
        res[st.top()] = i; // store index of next greater
        st.pop();
      }
      st.push(i);
    }
  } else if (type == 2) {
    // Previous Greater Element (left)
    for (int i = 0; i < n; i++) {
      while (!st.empty() && arr[st.top()] <= arr[i])
        st.pop();
      if (!st.empty())
        res[i] = st.top();
      st.push(i);
    }
  } else if (type == 3) {
    // Next Smaller Element (right)
    for (int i = 0; i < n; i++) {
      while (!st.empty() && arr[i] < arr[st.top()]) {
        res[st.top()] = i;
        st.pop();
      }
      st.push(i);
    }
  } else if (type == 4) {
    // Previous Smaller Element (left)
    for (int i = 0; i < n; i++) {
      while (!st.empty() && arr[st.top()] >= arr[i])
        st.pop();
      if (!st.empty())
        res[i] = st.top();
      st.push(i);
    }
  }

  return res;
}
