/* 2022.07.14  Created Buy Ximya
*  String의 Character 개수를 제한하는 익스텐션
*  지정된 개수보다 String Character 개수가 클 경우 '...' 을 리턴함
*  ex) 아무개아무개아무개 ===> 아무개아무개...
* */

extension StringLenghtValidation on String {
  String limitStringLength(int limitLength) {
    return length > limitLength ? '${substring(0, limitLength)}...' : this;
  }
}
