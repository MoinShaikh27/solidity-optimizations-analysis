// SPDX-License-Identifier: UNLICENSED

contract test {
	function numerically_unreachable_code (uint[] memory input_array) public pure returns (uint) {
		uint val;
		uint result;

		val = input_array[0x450];
		if (val > 0x7000) {
			// This will be overwritten
			result = 0x5500;

			if (val > 0x9000) {
				// This will be overwritten by the next block
				// even if it runs
				result = 0x6500;
			}
			result = 0x6400;
			if (val > 0x7000) {
				// This block overwrites previous writes to result
				result = 0x6000;
			}
			if (val == 0x7000) {
				// Not reachable
				result = 0x10000;
			}
			if (val < 0x3000) {
				// Not reachable
				result = 0x12000;
			}
			return result;

		}
		
		if (val < 0x90000) {
			result = 0x7800;
			
			// unconditional if-else: above store is useless
			if (val < 0x80000)
				result = 0x7700;
			else
				result = 0x7600;

		}
		return result;
	}
}
