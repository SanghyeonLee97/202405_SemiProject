package controller;

public class Temp2 {

	public static void main(String[] args) {
		int a=5;
		int b=10;
		//a와 b를 Temp의 a에 전송한다
		
		Temp temp = new Temp(a,b);
		
		temp.a();
	}

}
