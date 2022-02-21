package com.scm.javatrainning.day1;

/**
 * <h2>Tutorial3 Class</h2>
 * <p>
 * Process for Displaying Tutorial3. -Display the pattern like right angle
 * triangle.
 * </p>
 * 
 * @author Acer
 *
 */
public class Tutorial3 {

	/**
	 * <h2>displayPattern</h2>
	 * <p>
	 * Display pattern like right angle triangle by limit number.
	 * </p>
	 *
	 * @param num
	 * @return void
	 */
	public static void displayPattern(int num) {
		for (int i = 0; i < num; i++) {
			for (int j = 0; j < i + 1; j++) {
				int x = j + 1;
				System.out.print(x);
			}
			System.out.println();
		}
	}

	/**
	 * <h2>main</h2>
	 * <p>
	 * Main method to run project.
	 * </p>
	 *
	 * @param args
	 * @return void
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		displayPattern(10);
	}

}
