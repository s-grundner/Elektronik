public class Game {
	public static void main(String[] args) {

		Out.println("Please enter your name: ");
		String name = In.readString();

		Out.println("How old is your hero? ");

		int age = In.readInt();

		Out.println("How much can he/she carry? ");
		double weight = In.readDouble();

		String template = "Your hero is called %s, is %d years old and can carry %f kg";
		String output = String.format(template, name, age, weight);

		Out.println(output);
	}
}
