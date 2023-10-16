public class Game {
	public static void main(String[] args) {
		Out.print("Please enter your name: ");
		String name = In.readString();

		Out.print("How old is your hero? ");
		int age = In.readInt();

		Out.print("How much can he/she hero? ");
		double weight = In.readDouble();

		String template = "Your hero is called %s, is %d years old and can carry %f kg";
		String output = String.format(template, name, age, weight);

		Out.println(output);
	}
}
