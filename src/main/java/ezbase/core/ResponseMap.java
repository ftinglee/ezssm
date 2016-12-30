package ezbase.core;

import java.util.HashMap;

/**
 * Created by leezhao on 16/12/30.
 */
public class ResponseMap extends HashMap {

    private final String MSG = "msg";
    private final String DATA = "data";
    private final String STATE = "state";

    private ResponseMap(){}

    public static ResponseMap create(){
        return new ResponseMap();
    }
    public ResponseMap push(String key, Object value){
        super.put(key,value);
        return this;
    }

    public ResponseMap state(Integer state){
        return this.push(STATE,state);
    }

    public ResponseMap msg(String msg){
        return this.push(MSG,msg);
    }

    public ResponseMap data(Object data){
        return this.push(DATA,data);
    }
}
