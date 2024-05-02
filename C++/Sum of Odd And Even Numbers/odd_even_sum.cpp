#include <iostream>
#include <vector>

int main () {
  int total_even = 0;
  int product_odd = 1;

  std::vector<int> nums = {2,4,3,6,1,9};

  for (int i =0; i < nums.size(); i++) {
    // Checks if there is no remainer, meaning its even
    if(nums[i] % 2 == 0) {
        total_even = total_even + nums[i];
    // if there is a remainer meaning its odd.
    } else {
        product_odd = product_odd * nums[i];
    }
  }

  std::cout << "Sum of Even : " << total_even << "\n"; 
  std::cout << "Sum of odd : " << product_odd; 
}
