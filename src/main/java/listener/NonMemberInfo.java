package listener;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
 
 
public class NonMemberInfo implements HttpSessionBindingListener {
     String id;
     String password;
 
 
     // 기본 생성자가 꼭 있어햐 함
     public NonMemberInfo() {
     }
 
 
     public NonMemberInfo(String id, String password) {
           this.id = id;
           this.password = password;
     }
 
 
     public String getId() {
           return id;
     }
 
 
     @Override
     public void valueBound(HttpSessionBindingEvent hsbe) {
           System.out.println("NonMemberInfo 객체가 세션에 바인딩됨");
     }
 
 
     @Override
     public void valueUnbound(HttpSessionBindingEvent hsbe) {
           System.out.println("NonMemberInfo 객체가 세션에서  언바인딩(제거됨)");
     }
 
 
}
